import 'package:flutter/material.dart';
import 'package:flutter_admin_panel/flutter_admin_panel.dart';
import 'package:flutter_admin_panel/src/bloc/admin_panel_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPanelSideMenu extends StatelessWidget {
  const AdminPanelSideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      buildWhen: (previous, current) =>
          previous.sideMenuStatus != current.sideMenuStatus,
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: state.sideMenuStatus == SideMenuStatus.expanded ? 280 : 70,
          color: Theme.of(context).dialogBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: const [
                    Expanded(child: DefaultSideMenuLogo()),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children:
                      context.read<AdminPanelBloc>().state.sideMenuSections,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
