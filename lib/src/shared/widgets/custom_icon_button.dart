import 'package:flutter/material.dart';

/// A custom icon button widget.
///
/// This widget takes an image asset path and a callback function
/// for the button press event.
class CustomIconButton extends StatelessWidget {
  /// Creates a custom icon button.
  ///
  /// The [iconPath] and [onPressed] parameters must not be null.
  const CustomIconButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
  });

  /// The path to the image asset used as an icon.
  final String iconPath;

  /// The callback function that is called when the button is pressed.
  final VoidCallback onPressed;

  /// Builds the widget.
  ///
  /// This method creates an `ElevatedButton` with an image asset as a child.
  /// The image asset's width and height are set to 24.
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), // Makes the button circular
          padding: const EdgeInsets.all(4), // Reduces padding to zero
          // You can adjust other styling here if needed
          ),
      child: Image.asset(
        iconPath,
        package: 'flexilayout',
        width: 24,
        height: 24,
      ), // Icon size
    );
  }
}
