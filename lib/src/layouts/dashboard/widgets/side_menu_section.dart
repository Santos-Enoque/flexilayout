import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that represents a section in the side menu.
///
/// The `SideMenuSection` widget is used to group related menu items together
///  in a section within the side menu.
/// It takes a `name`, `items`, and `priority` as parameters to define the
/// section's properties.
///
/// Example usage:
///
/// ```dart
/// SideMenuSection(
///   name: 'Settings',
///   items: [
///     SideMenuItem(
///       title: 'Profile',
///       icon: Icons.person,
///       onTap: () {
///         // Handle profile item tap
///       },
///     ),
///     SideMenuItem(
///       title: 'Preferences',
///       icon: Icons.settings,
///       onTap: () {
///         // Handle preferences item tap
///       },
///     ),
///   ],
///   priority: 2,
/// ),
/// ```
class SideMenuSection extends StatelessWidget {
  /// Creates a `SideMenuSection` widget.
  ///
  /// The `name` parameter is optional and specifies the name of the
  /// menu section.
  /// The `items` parameter is required and defines the elements that are part
  /// of the section.
  /// The `priority` parameter is required and determines the
  /// position of the section in the side menu.
  const SideMenuSection({
    super.key,
    this.name,
    required this.items,
    required this.priority,
  }) : assert(priority > 0, 'Position starts from 1');

  /// Name of the menu section
  ///
  /// if it's null the section will be displayed with no name
  final String? name;

  /// Priority of the [SideMenuSection] is the position of the section
  /// in the side-menu
  ///
  /// The lower the priority value the higher the position of the section
  /// within the side-menu. This value should be unique and start from 1
  final int priority;

  /// Elements that are part of a given section of the side menu
  final List<MenuItem> items;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelBloc, DashboardState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (name != null && state.sideMenuStatus.isExpanded())
              ListTile(
                title: Text(
                  name!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: items,
            ),
          ],
        );
      },
    );
  }
}
