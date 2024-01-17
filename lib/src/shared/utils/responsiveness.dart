import 'package:flutter/material.dart';

/// A widget for responsive design.
/// It displays different widgets based on the screen size.
class Responsive extends StatelessWidget {
  /// Creates a responsive widget.
  ///
  /// The [mobile] and [desktop] parameters must not be null.
  /// The [tablet] parameter is optional.
  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  /// The widget to display on mobile devices.
  final Widget mobile;

  /// The widget to display on tablet devices.
  final Widget? tablet;

  /// The widget to display on desktop devices.
  final Widget desktop;

  /// Returns true if the screen width is less than 850.
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  /// Returns true if the screen width is between 850 and 1100.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  /// Returns true if the screen width is greater than or equal to 1100.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  /// Builds the widget based on the screen size.
  ///
  /// If the screen width is greater than or equal to 1100, the [desktop] widget
  ///  is displayed.
  /// If the screen width is between 850 and 1100, the [tablet] widget is
  /// displayed if it is not null, otherwise the [mobile] widget is displayed.
  /// If the screen width is less than 850, the [mobile] widget is displayed.
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width >= 1100) {
      return desktop;
    } else if (size.width >= 850 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
