import 'package:flutter/material.dart';
import 'package:flutter_admin_panel/flutter_admin_panel.dart';
import 'package:flutter_admin_panel/src/bloc/admin_panel_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopUpMenu extends StatelessWidget {
  PopUpMenu({
    Key? key,
    required this.sideMenuItem,
    required this.index,
  })  : id = sideMenuItem.id!,
        super(key: key);

  /// The side menu item to to displayed in the pop up menu
  final SideMenuItem sideMenuItem;

  /// Keeps track of the index of the [SideMenuItem] from the list of items
  ///
  /// This variable is used to position the pop up menu next to the respective
  /// [SideMenuItem]
  final int index;

  /// Unique identifier used to identify the [PopUpMenu]
  ///
  /// We assign it the value of the  [SideMenuItem] absolute position (which is
  /// unique as well) and it is used to associate [PopUpMenu] with it's
  /// respoective [SideMenuItem]
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
        color: Theme.of(context).backgroundColor,
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

class PopUpSideMenuItemElement extends StatelessWidget {
  PopUpSideMenuItemElement({
    Key? key,
    required this.element,
  })  : sideMenuItemElementAbsolutePosition = element.id!,
        super(key: key);

  /// The [SideMenuSubItem] to be displayed
  final SideMenuSubItem element;

  /// A unique identifier used to tell where the element is
  /// positioned within the side menu. Since this variable is unique we use it
  /// to keep track [SideMenuItem]'s being hovered and so on
  final String sideMenuItemElementAbsolutePosition;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
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
