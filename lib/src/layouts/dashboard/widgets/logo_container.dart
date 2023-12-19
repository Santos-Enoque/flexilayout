// ignore_for_file: lines_longer_than_80_chars

import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays the default side menu logo.
///
/// The `LogoContainer` widget is used to show the logo in the side menu of the admin panel.
/// It consists of a `Logo` widget followed by the application name, 'Cytop'.
///
/// Example usage:
///
/// ```dart
/// LogoContainer(),
/// ```
class LogoContainer extends StatelessWidget {
  /// Creates a `LogoContainer` widget.
  const LogoContainer({
    super.key,
    this.name = 'Flexilayout',
    this.icon = Icons.dashboard_customize_rounded,
  });

  /// Default name
  final String name;

  /// Default logo
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      builder: (context, state) {
        return Row(
          children: [
            Logo(
              icon: icon,
            ),
            if (state.sideMenuStatus.isExpanded())
              const SizedBox(
                width: 10,
              ),
            if (state.sideMenuStatus.isExpanded())
              Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
          ],
        );
      },
    );
  }
}

/// A widget that displays a logo with an icon.
///
/// The `Logo` widget is typically used as a branding element in an application's side menu or header.
/// It displays a circular container with an icon inside it.
///
/// The `icon` parameter specifies the icon to be displayed in the logo.
///
/// Example usage:
///
/// ```dart
/// Logo(
///   icon: Icons.dashboard_customize_rounded,
/// ),
/// ```
class Logo extends StatelessWidget {
  /// Creates a `Logo` widget.
  ///
  /// The `icon` parameter is required and specifies the icon to be displayed in the logo.
  const Logo({
    super.key,
    required this.icon,
  });

  /// The icon to be displayed in the logo.
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
