import 'package:flexilayout/flexilayout.dart';
import 'package:flexilayout/src/shared/utils/get_item_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that represents a sub-item in a side menu.
///
/// The `SideMenuSubItem` widget is used to display a sub-item within a side
/// menu.
/// It takes a `name`, `priority`, and `page` as parameters to define
/// the sub-item's properties.
///
/// Example usage:
///
/// ```dart
/// SideMenuSubItem(
///   name: 'Profile',
///   priority: 1,
///   page: ProfilePage(),
/// ),
/// ```
// ignore: must_be_immutable
class SideMenuSubItem extends StatelessWidget {
  /// Creates a `SideMenuSubItem` widget.
  ///
  /// The `name` parameter is required and specifies the name of the sub-item.
  /// The `priority` parameter is required and determines the position of the
  /// sub-item within the parent item.
  /// The `page` parameter is required and defines the widget that is displayed
  /// when the sub-item is clicked.
  SideMenuSubItem({
    super.key,
    required this.name,
    required this.priority,
    required this.page,
  }) : assert(priority > 0, 'item and parent positions must start from 1');

  /// The name of the sub-item.
  final String name;

  /// The priority of the `SideMenuSubItem` determines its position
  /// within a parent `SideMenuItem`.
  ///
  /// The lower the `priority` value, the higher the
  /// position of the sub-item within the parent item.
  /// This value should be unique and start from 1.
  final int priority;

  /// The widget that is displayed when the sub-item is clicked.
  final Widget page;

  /// A unique identifier for each [SideMenuSubItem]
  ///
  /// This variable will be used to keep track of elements being hovered/active
  /// items
  String? id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelBloc, DashboardState>(
      builder: (context, state) {
        bool isHoverOrActive() {
          return id! == state.sideMenuItemBeingHovered ||
              id! == state.sideMenuActiveItem;
        }

        return ItemContainer(
          isExpanded: false,
          isActiveOrHovered: isHoverOrActive(),
          itemId: id!,
          child: ListTile(
            onTap: () {
              context.read<AdminPanelBloc>().add(
                    DashboardSideMenuItemClicked(id!),
                  );
            },
            title: Text(
              name,
              style: TextStyle(
                color: getItemColor(context, isActive: isHoverOrActive()),
                fontWeight:
                    isHoverOrActive() ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      },
    );
  }
}
