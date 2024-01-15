// ignore_for_file: lines_longer_than_80_chars

import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';

/// Represents the menu data.
///
/// The `MenuData` class represents the data for the menu in the application.
/// It includes properties for the list of menu items and menu sections.
class MenuData {
  /// Creates a `MenuData` instance.
  ///
  /// The `MenuData` constructor requires the following parameters:
  ///
  /// - `items`: The list of menu items.
  /// - `sections`: The list of menu sections.
  /// - `pageMap`: The map of item IDs to their corresponding pages.

  MenuData({
    this.items,
    this.sections,
  }) : assert(
          items != null || sections != null,
          'Either items or sections must be provided.',
        );

  /// The list of menu items.
  final List<MenuItem>? items;

  /// The list of menu sections.
  final List<MenuSection>? sections;

  /// Returns a map of item IDs to their corresponding pages.
  ///
  /// The `pageMap` getter generates a map that maps each item ID to its corresponding page widget.
  /// It iterates through the menu sections and their associated items, as well as the standalone menu items,
  /// and adds them to the map with their respective IDs as keys and their page widgets as values.
  /// The resulting map can be used to easily retrieve the page widget for a specific item ID.
  Map<String, Widget> get pageMap {
    final map = <String, Widget>{};
    
    if (sections != null) {
      for (final section in sections!) {
        for (final item in section.items) {
          map[item.id] = item.page;
        }
      }
    }

    if (items != null) {
      for (final item in items!) {
        map[item.id] = item.page;
      }
    }

    return map;
  }
}
