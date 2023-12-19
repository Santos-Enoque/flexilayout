// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flexilayout/flexilayout.dart';
import 'package:flexilayout/src/layouts/dashboard/widgets/top_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabletView extends StatelessWidget {
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