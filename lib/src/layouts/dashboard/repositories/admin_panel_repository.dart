// ignore_for_file: unnecessary_parenthesis, strict_raw_type, avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:flexilayout/flexilayout.dart';

class AdminPanelRepository {
  AdminPanelRepository({required this.sideMenuSections}) {
    _sortSideMenuSections();
    _sortSideMenuItems();
  }

  final _decimalPlacesPrecision = 7;
  final List<SideMenuSection> sideMenuSections;

  List<SideMenuItem> getSideMenuItems() {
    return sideMenuSections.expand((section) => section.items).toList();
  }

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

  /// Return a [List] of the id's of all items that have associated pages
  ///
  /// This is required because expandable [SideMenuItem] objects do not have
  /// pages associated with then. In other words, when we click on an expandable
  /// item it expands and reveals it's child elements, but it does not display
  /// a new page.
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
