// ignore_for_file: prefer_const_constructors, lines_longer_than_80_chars

import 'package:flexilayout/flexilayout.dart';
import 'package:flexilayout/src/layouts/dashboard/widgets/top_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represents the tablet view of the application.
///
/// The `TabletView` widget is used to display the tablet version of the application.
/// It takes no additional parameters and renders the content specific to the tablet view.
///
/// Example usage:
///
/// ```dart
/// TabletView(),
/// ```
class TabletView extends StatelessWidget {
  /// Creates a `TabletView` widget.
  const TabletView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AdminPanelBloc, AdminPanelState>(
        builder: (context, state) {
          return Stack(
            children: [
              Row(
                children: [
                  const AdminPanelSideMenu(),
                  Expanded(
                    child: MouseRegion(
                        onEnter: (event) {
                          context
                              .read<AdminPanelBloc>()
                              .add(AdminPanelCursorEnteredContententSection());
                        },
                        child: Scaffold(
                          appBar: topNavBar(context),
                          body: state.pages.isEmpty
                              ? Container()
                              : state.pages[state.idsOfItemsWithPages
                                  .indexOf(state.sideMenuActiveItem)],
                        )),
                  )
                ],
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: 14,
                left: state.sideMenuStatus.isExpanded() ? 300 : 80,
                child: InkWell(
                  onTap: () {
                    context
                        .read<AdminPanelBloc>()
                        .add(AdminPanelSideMenuTogglePressed());
                  },
                  child: const Icon(
                    Icons.menu,
                    size: 24,
                  ),
                ),
              ),
              if (!state.sideMenuStatus.isExpanded())
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(state.sideMenuItems.length, (index) {
                    final sideMenuItem = state.sideMenuItems[index];
                    if (sideMenuItem.isExpandable) {
                      return sideMenuItem.id! == state.activePopUpSideMenuId
                          ? PopUpMenu(
                              sideMenuItem: sideMenuItem,
                              index: index,
                            )
                          : Container();
                    } else {
                      return Container();
                    }
                  }),
                )
            ],
          );
        },
      ),
    );
  }
}
