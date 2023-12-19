// ignore_for_file: lines_longer_than_80_chars

import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A widget that displays a pop-up menu for a side menu item.
///
/// The `PopUpMenu` widget is used to show a pop-up menu next to a specific side menu item.
/// It takes a `SideMenuItem` and an `index` as parameters to position the pop-up menu correctly.
///
/// Example usage:
///
/// ```dart
/// PopUpMenu(
///   sideMenuItem: mySideMenuItem,
///   index: 0,
/// ),
class PopUpMenu extends StatelessWidget {
  /// Creates a `PopUpMenu` widget.
  ///
  /// The `sideMenuItem` parameter is required and specifies the side menu item to be displayed in the pop-up menu.
  /// The `index` parameter is required and keeps track of the index of the `SideMenuItem` from the list of items.
  PopUpMenu({
    super.key,
    required this.sideMenuItem,
    required this.index,
  }) : id = sideMenuItem.id!;

  /// The side menu item to to displayed in the pop up menu
  final MenuItem sideMenuItem;

  /// Keeps track of the index of the [MenuItem] from the list of items
  ///
  /// This variable is used to position the pop up menu next to the respective
  /// [MenuItem]
  final int index;

  /// Unique identifier used to identify the [PopUpMenu]
  ///
  /// We assign it the value of the  [MenuItem] absolute position (which is
  /// unique as well) and it is used to associate [PopUpMenu] with it's
  /// respoective [MenuItem]
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(
        left: 70,
        top: 65 + (60 * index) as double,
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(10, 10),
            blurRadius: 15,
            spreadRadius: -9,
          ),
        ],
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(sideMenuItem.subItems!.length, (index) {
          final element = sideMenuItem.subItems![index];
          return PopUpSideMenuItemElement(element: element);
        }),
      ),
    );
  }
}

/// A widget that displays a side menu sub-item in a pop-up menu.
///
/// The `PopUpSideMenuItemElement` widget is used to show a side menu sub-item in a pop-up menu.
/// It takes a `SideMenuSubItem` as a parameter to display the sub-item details.
///
/// Example usage:
///
/// ```dart
/// PopUpSideMenuItemElement(
///   element: mySideMenuSubItem,
/// ),
/// ```
class PopUpSideMenuItemElement extends StatelessWidget {
  /// Creates a `PopUpSideMenuItemElement` widget.
  ///
  /// The `element` parameter is required and specifies the side menu sub-item to be displayed.
  PopUpSideMenuItemElement({
    super.key,
    required this.element,
  }) : sideMenuItemElementAbsolutePosition = element.id!;

  /// The [SideMenuSubItem] to be displayed
  final SideMenuSubItem element;

  /// A unique identifier used to tell where the element is
  /// positioned within the side menu. Since this variable is unique we use it
  /// to keep track [MenuItem]'s being hovered and so on
  final String sideMenuItemElementAbsolutePosition;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelBloc, DashboardState>(
      builder: (context, state) {
        bool isHoverOrActive() {
          return element.id! == state.popUpSideMenuItemElementBeingHovered;
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: ItemContainer(
            isPopUpMenuItem: true,
            isExpanded: false,
            isActiveOrHovered: isHoverOrActive(),
            itemId: element.id!,
            child: ListTile(
              onTap: () {},
              title: Text(
                element.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        );
      },
    );
  }
}
