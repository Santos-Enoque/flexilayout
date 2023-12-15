// ignore_for_file: lines_longer_than_80_chars, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_admin_panel/flutter_admin_panel.dart';
import 'package:flutter_admin_panel/src/bloc/admin_panel_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

///
class SideMenuItem extends StatefulWidget {
  SideMenuItem({
    Key? key,
    required this.icon,
    required this.name,
    this.subItems,
    this.isExpandable = false,
    required this.priority,
    this.page,
  })  : assert(priority > 0, 'Position of an item starts from 1'),
        assert(
          !isExpandable || subItems != null,
          'if SideMenuItem is expandable the elemensts list cannot be null',
        ),
        assert(
          (!isExpandable && page != null) || (isExpandable && page == null),
          'Expandable items cannot have a page property, and non-expandable items must have page property',
        ),
        super(key: key);

  /// Icon of the [SideMenuItem]
  final IconData icon;

  /// Priority of the [SideMenuItem] isthe position of the
  /// [SideMenuItem] within the [SideMenuSection]
  ///
  /// The lower the priority value, the higher the position of the item
  /// within the [SideMenuSection]. This value should be unique and start from 1
  final int priority;

  /// Used to check whether the [SideMenuItem] is expandable or not
  ///
  /// if set to true a list of [SideMenuItem] must be provided
  final bool isExpandable;

  /// Name of the [SideMenuItem]
  final String name;

  /// The sub-items that are displayed when the [SideMenuItem] is
  /// expanded
  final List<SideMenuSubItem>? subItems;

  /// A unique identifier for each [SideMenuItem]
  ///
  /// This variable will be used to keep track of items being hovered/active
  /// items. This value is automatically set in the business logic
  String? id;

  /// The widget that is displayed on the content section when the
  /// [SideMenuItem] is clicked
  ///
  /// Expandable sideMenuItems do not have an associated page widget
  final Widget? page;

  @override
  State<SideMenuItem> createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  /// A unique identifier for each [SideMenuItem]
  ///
  /// This variable will be used to keep track of items being hovered/active
  /// items
  String? itemId;

  bool _isItemExpanded = false;

  @override
  void initState() {
    itemId = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      builder: (context, state) {
        bool isHoverOrActive() {
          return itemId! == state.sideMenuItemBeingHovered ||
              itemId! == state.sideMenuActiveItem;
        }

        if (!widget.isExpandable) {
          return !state.sideMenuStatus.isExpanded()
              ? ItemContainer(
                  isExpanded: false,
                  itemId: itemId!,
                  isActiveOrHovered: isHoverOrActive(),
                  child: IconsSideMenuItem(icon: widget.icon))
              : ItemContainer(
                  isExpanded: false,
                  itemId: itemId!,
                  isActiveOrHovered: isHoverOrActive(),
                  child: ListTile(
                    onTap: () {
                      context.read<AdminPanelBloc>().add(
                            AdminPanelSideMenuItemCllicked(itemId!),
                          );
                    },
                    leading: Icon(
                      widget.icon,
                      color: isHoverOrActive()
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    title: Text(
                      widget.name,
                      style: TextStyle(
                        color: isHoverOrActive()
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                );
        }
        return state.sideMenuStatus.isExpanded()
            ? ItemContainer(
                isExpanded: _isItemExpanded,
                itemId: itemId!,
                isActiveOrHovered: isHoverOrActive() && !_isItemExpanded,
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    setState(() {
                      _isItemExpanded = value;
                    });
                  },
                  leading: Icon(
                    widget.icon,
                    color: isHoverOrActive() && !_isItemExpanded
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  title: Text(
                    widget.name,
                    style: TextStyle(
                      color: isHoverOrActive() && !_isItemExpanded
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                  children: widget.subItems!,
                ),
              )
            : ItemContainer(
                isExpanded: false,
                itemId: itemId!,
                isActiveOrHovered: isHoverOrActive(),
                child: IconsSideMenuItem(icon: widget.icon));
      },
    );
  }
}

/// A container used to change the look of the the side menu items depending on
/// whether the item is is hovered or cliked on
class ItemContainer extends StatelessWidget {
  ItemContainer(
      {super.key,
      required this.child,
      required this.isExpanded,
      required this.isActiveOrHovered,
      required this.itemId,
      this.isPopUpMenuItem = false});

  /// The widget being wrapped
  final Widget child;

  /// Checks is the item is active or being hovered
  final bool isActiveOrHovered;

  /// A unique identifier for each [SideMenuItem]
  ///
  /// This variable will be used to keep track of items being hovered/active
  /// items
  final String itemId;

  /// Checks whether the [SideMenuItem] is collapsed or expanded
  ///
  /// This is only varible is used to make sure that when an expandable
  /// [SideMenuItem] it's onHover event is not registered so that it does not
  /// affect the onHover event of it's child elements
  final bool isExpanded;

  bool isPopUpMenuItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      builder: (context, state) {
        return MouseRegion(
          onExit: (event) {
            if (!isExpanded) {
              context.read<AdminPanelBloc>().add(
                  AdminPanelSideMenuItemHoverExited(
                      id: itemId, isPopUpMenuItem: isPopUpMenuItem));
            }
          },
          onEnter: (event) {
            if (!isExpanded) {
              context.read<AdminPanelBloc>().add(
                    AdminPanelSideMenuItemHovered(
                        id: itemId, isPopUpMenuItem: isPopUpMenuItem),
                  );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            margin: EdgeInsets.symmetric(
                horizontal: state.sideMenuStatus.isExpanded() ? 6 : 0,
                vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: isActiveOrHovered
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Colors.transparent,
            ),
            child: child,
          ),
        );
      },
    );
  }
}

/// Icon that is displayed when side menu is minimized
class IconsSideMenuItem extends StatelessWidget {
  const IconsSideMenuItem({
    Key? key,
    required this.icon,
  }) : super(key: key);

  /// The icon to be displayed when the side menu is minimized
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Icon(icon),
    );
  }
}
