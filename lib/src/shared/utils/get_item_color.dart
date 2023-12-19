// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

/// Returns the color for an item based on its active state.
///
/// The `getItemColor` function takes a `BuildContext` and a boolean `isActive` parameter as input.
/// It returns a `Color` that represents the color of the item based on its active state.
/// If the item is active, it returns the color defined by the `textTheme.bodyMedium.color` property.
/// If the item is not active, it returns a slightly transparent version of the `textTheme.bodyMedium.color`.
///
/// Example usage:
///
/// ```dart
/// Color color = getItemColor(context, true);
/// ```
Color getItemColor(BuildContext context, {bool isActive = false}) {
  if (isActive) {
    return Theme.of(context).textTheme.bodyMedium!.color!;
  } else {
    return Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.7);
  }
}
