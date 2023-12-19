// ignore_for_file: unnecessary_parenthesis, strict_raw_type, avoid_dynamic_calls, directives_ordering, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flexilayout/flexilayout.dart';

/// Represents the repository for the dashboard.
///
/// The `DashboardRepository` class is responsible for providing data and operations related to the dashboard.
/// It contains methods to retrieve side menu items, pages, and IDs of items with associated pages.
class DashboardRepository {
  /// Creates a `DashboardRepository` instance.
  ///
  /// The `DashboardRepository` constructor requires the following parameter:
  ///
  /// - `sideMenuSections`: A list of `SideMenuSection` objects representing the sections of the side menu.
  DashboardRepository({required this.sideMenuSections}) {
    _sortSideMenuSections();
    _sortSideMenuItems();
  }

  final _decimalPlacesPrecision = 7;

  /// A list of `SideMenuSection` objects representing the sections of the side menu.
  final List<SideMenuSection> sideMenuSections;

  /// Retrieves the side menu items from the repository.
  ///
  /// Returns a list of `MenuItem` objects representing the side menu items.
  List<MenuItem> getSideMenuItems() {
    return sideMenuSections.expand((section) => section.items).toList();
  }

  /// Retrieves the pages from the repository.
  ///
  /// Returns a list of `Widget` objects representing the pages associated with the side menu items.
  List<Widget> getPages() {
    return sideMenuSections.expand((section) {
      return section.items.expand((item) {
        if (!item.isExpandable) {
          return [item.page!];
        } else {
          return item.subItems!.map((subItem) => subItem.page);
        }
      });
    }).toList();
  }

  /// Retrieves the IDs of items with associated pages from the repository.
  ///
  /// Returns a list of `String` representing the IDs of items that have associated pages.
  /// This is required because expandable `MenuItem` objects do not have pages associated with them.
  List<String> getIdOfItemsWithPages() {
    final positions = <String>[];
    for (final section in sideMenuSections) {
      for (final item in section.items) {
        final positionAsString = (section.priority + (item.priority / 10))
            .toStringAsFixed(_decimalPlacesPrecision);
        item.id = positionAsString;
        if (item.isExpandable) {
          for (final element in item.subItems!) {
            final elementPositionAsString = (section.priority +
                    (item.priority / 10) +
                    (element.priority / 100))
                .toStringAsFixed(_decimalPlacesPrecision);
            element.id = elementPositionAsString;
            positions.add(element.id!);
          }
        } else {
          positions.add(item.id!);
        }
      }
    }

    positions.sort((a, b) => a.compareTo(b));
    return positions;
  }

  void _sortSideMenuSections() {
    _assertUniquePriorities(sideMenuSections, 'SideMenuSection');
    sideMenuSections.sort(((a, b) => a.priority.compareTo(b.priority)));
  }

  void _sortSideMenuItems() {
    for (final section in sideMenuSections) {
      _assertUniquePriorities(section.items, 'SideMenuItem');
      section.items.sort(((a, b) => a.priority.compareTo(b.priority)));

      for (final item in section.items) {
        if (item.isExpandable) {
          _assertUniquePriorities(item.subItems!, 'SideMenuSubItem');
          item.subItems!.sort((a, b) => a.priority.compareTo(b.priority));
        }
      }
    }
  }

  void _assertUniquePriorities(List list, String itemType) {
    assert(
      list.length == Set<int>.from(list.map((i) => i.priority)).length,
      '$itemType priority must be unique numbers',
    );
  }
}
