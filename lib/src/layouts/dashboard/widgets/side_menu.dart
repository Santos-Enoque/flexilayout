import 'package:flutter/material.dart';
import 'package:flexilayout/flexilayout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPanelSideMenu extends StatelessWidget {
  const AdminPanelSideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
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
                    Expanded(child: LogoContainer()),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children:
                      context.read<DashboardBloc>().state.sideMenuSections,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
