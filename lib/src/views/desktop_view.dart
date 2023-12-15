// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_admin_panel/flutter_admin_panel.dart';
import 'package:flutter_admin_panel/src/bloc/admin_panel_bloc.dart';
import 'package:flutter_admin_panel/src/widgets/top_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

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
                              : Container(
                                  padding: const EdgeInsets.all(20),
                                  child: state.pages[state.idsOfItemsWithPages
                                      .indexOf(state.sideMenuActiveItem)],
                                ),
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
                    Icons.sort,
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
