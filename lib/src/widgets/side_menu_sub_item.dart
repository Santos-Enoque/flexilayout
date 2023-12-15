import 'package:flutter/material.dart';
import 'package:flutter_admin_panel/flutter_admin_panel.dart';
import 'package:flutter_admin_panel/src/bloc/admin_panel_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenuSubItem extends StatelessWidget {
  SideMenuSubItem({
    Key? key,
    required this.name,
    required this.priority,
    required this.page,
  })  : assert(priority > 0, 'item and parent positions must start from 1'),
        super(key: key);

  /// Name of the [SideMenuSubItem]
  final String name;

  /// Priority of the [SideMenuSubItem] is basically the position of th
  /// [SideMenuSubItem] within an expandable [SideMenuItem]
  ///
  /// The lower the priority value the higher the position of the sub-item
  /// within the [SideMenuItem]. This value should be unique and start from 1
  final int priority;

  /// A unique identifier for each [SideMenuSubItem]
  ///
  /// This variable will be used to keep track of elements being hovered/active
  /// items
  String? id;

  /// The widget that is displayed on the content section when the
  /// [SideMenuSubItem] is clicked
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
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
                      AdminPanelSideMenuItemCllicked(id!),
                    );
              },
              title: Text(
                name,
                style: TextStyle(
                  color: isHoverOrActive()
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).colorScheme.secondaryContainer,
                ),
              )),
        );
      },
    );
  }
}
