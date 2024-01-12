import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// Represents a menu section.
///
/// The `MenuSection` class represents a section in the menu.
/// It includes properties for the section's
/// ID, title, icon, and associated items.
class MenuSection {
  /// Creates a `MenuSection` instance.
  ///
  /// The `MenuSection` constructor requires the following parameters:
  ///
  /// - `icon`: The icon data for the section.
  /// - `title`: The title of the section.
  /// - `items`: The list of associated menu items for the section.
  MenuSection(
      {this.icon = Icons.dashboard, required this.title, required this.items,})
      : id = const Uuid().v4();

  /// The unique ID of the menu section.
  final String id;

  /// The title of the menu section.
  final String title;

  /// The icon data for the menu section.
  final IconData icon;

  /// The list of associated menu items for the menu section.
  final List<MenuItem> items;
}
