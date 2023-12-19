// ignore_for_file: lines_longer_than_80_chars, must_be_immutable

import 'package:flexilayout/flexilayout.dart';
import 'package:flexilayout/src/shared/utils/get_item_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represents a side menu item in the dashboard layout.
class MenuItem extends StatefulWidget {
  /// Creates a new [MenuItem] instance.
  MenuItem({
    super.key,
    required this.icon,
    required this.name,
    this.subItems,
    this.isExpandable = false,
    required this.priority,
    this.page,
  })  : assert(priority > 0, 'Position of an item starts from 1'),
        assert(
          !isExpandable || subItems != null,
          'if SideMenuItem is expandable the elements list cannot be null',
        ),
        assert(
          (!isExpandable && page != null) || (isExpandable && page == null),
          'Expandable items cannot have a page property, and non-expandable items must have page property',
        );

  /// Icon of the [MenuItem].
  final IconData icon;

  /// Priority of the [MenuItem] within the [SideMenuSection].
  ///
  /// The lower the priority value, the higher the position of the item
  /// within the [SideMenuSection]. This value should be unique and start from 1.
  final int priority;

  /// Indicates whether the [MenuItem] is expandable or not.
  ///
  /// If set to true, a list of [MenuItem] must be provided.
  final bool isExpandable;

  /// Name of the [MenuItem].
  final String name;

  /// The sub-items that are displayed when the [MenuItem] is expanded.
  final List<SideMenuSubItem>? subItems;

  /// A unique identifier for each [MenuItem].
  ///
  /// This variable will be used to keep track of items being hovered/active
  /// items. This value is automatically set in the business logic.
  String? id;

  /// The widget that is displayed on the content section when the
  /// [MenuItem] is clicked.
  ///
  /// Expandable sideMenuItems do not have an associated page widget.
  final Widget? page;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  String? itemId; // A unique identifier for each [SideMenuItem].
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
                  child: IconsSideMenuItem(icon: widget.icon),
                )
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
                      color: getItemColor(context, isActive: isHoverOrActive()),
                    ),
                    title: Text(
                      widget.name,
                      style: TextStyle(
                        color:
                            getItemColor(context, isActive: isHoverOrActive()),
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
                    color: getItemColor(
                      context,
                      isActive: isHoverOrActive() && !_isItemExpanded,
                    ),
                  ),
                  title: Text(
                    widget.name,
                    style: TextStyle(
                      color: getItemColor(
                        context,
                        isActive: isHoverOrActive() && !_isItemExpanded,
                      ),
                    ),
                  ),
                  children: widget.subItems!,
                ),
              )
            : ItemContainer(
                isExpanded: false,
                itemId: itemId!,
                isActiveOrHovered: isHoverOrActive(),
                child: IconsSideMenuItem(icon: widget.icon),
              );
      },
    );
  }
}

/// A container used to change the look of the the side menu items depending on
/// whether the item is is hovered or clicked on.
///
/// This widget wraps the [child] widget and applies different styles based on
/// the [isActiveOrHovered] property. It also handles hover events and updates
/// the state of the [AdminPanelBloc] accordingly.
///
/// The [itemId] is a unique identifier for each [MenuItem] and is used to
/// keep track of items being hovered/active.
///
/// The [isExpanded] property is used to determine whether the [MenuItem] is
/// collapsed or expanded. When an expandable [MenuItem] is expanded, its
/// onHover event is not registered to avoid affecting the onHover event of its
/// child elements.
///
/// The [isPopUpMenuItem] property is optional and is used to indicate whether
/// the item is a pop-up menu item.
class ItemContainer extends StatelessWidget {
  /// Creates an `ItemContainer` widget.
  ///
  /// The `child` parameter is required and represents the content of the menu item.
  /// The `isExpanded` parameter is required and indicates whether the menu item is expanded.
  /// The `isActiveOrHovered` parameter is required and indicates whether the menu item is active or hovered.
  /// The `itemId` parameter is required and represents the ID of the menu item.
  /// The `isPopUpMenuItem` parameter is optional and indicates whether the menu item is a pop-up menu item.
  ItemContainer({
    super.key,
    required this.child,
    required this.isExpanded,
    required this.isActiveOrHovered,
    required this.itemId,
    this.isPopUpMenuItem = false,
  });

  /// The widget being wrapped.
  final Widget child;

  /// Checks if the item is active or being hovered.
  final bool isActiveOrHovered;

  /// A unique identifier for each [MenuItem].
  ///
  /// This variable will be used to keep track of items being hovered/active
  /// items.
  final String itemId;

  /// Checks whether the [MenuItem] is collapsed or expanded.
  ///
  /// This variable is used to make sure that when an expandable [MenuItem]
  /// is expanded, its onHover event is not registered so that it does not
  /// affect the onHover event of its child elements.
  final bool isExpanded;

  /// Indicates whether the item is a pop-up menu item.
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
                      id: itemId,
                      isPopUpMenuItem: isPopUpMenuItem,
                    ),
                  );
            }
          },
          onEnter: (event) {
            if (!isExpanded) {
              context.read<AdminPanelBloc>().add(
                    AdminPanelSideMenuItemHovered(
                      id: itemId,
                      isPopUpMenuItem: isPopUpMenuItem,
                    ),
                  );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            margin: EdgeInsets.symmetric(
              horizontal: state.sideMenuStatus.isExpanded() ? 6 : 0,
              vertical: 4,
            ),
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

/// A widget that represents a menu item with an icon.
///
/// The `IconsSideMenuItem` widget is used to display a menu item with an icon.
/// It takes an `icon` parameter to define the icon for the menu item.
///
/// Example usage:
///
/// ```dart
/// IconsSideMenuItem(
///   icon: Icons.home,
/// ),
/// ```
class IconsSideMenuItem extends StatelessWidget {
  /// Creates an `IconsSideMenuItem` widget.
  ///
  /// The `icon` parameter is required and specifies the icon for the menu item.
  const IconsSideMenuItem({
    super.key,
    required this.icon,
  });

  /// The icon for the menu item.
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Icon(icon),
    );
  }
}
