import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// Represents a menu item.
///
/// The `MenuItem` class represents a menu item in the application. 
/// It includes properties for the item's ID, name, and associated page.
class MenuItem {
  /// Creates a `MenuItem` instance.
  ///
  /// The `MenuItem` constructor requires the following parameters:
  ///
  /// - `name`: The name of the menu item.
  /// - `icon`: The icon data for the section.
  /// - `page`: The associated page widget for the menu item.
  MenuItem({
    required this.name,
    required this.icon,
    required this.page,
  }) : id = const Uuid().v4();

  /// The unique ID of the menu item.
  final String id;

  /// The name of the menu item.
  final String name;

  /// The associated page widget for the menu item.
  final Widget page;

  /// The icon data for the menu section.
  final IconData icon;
}
