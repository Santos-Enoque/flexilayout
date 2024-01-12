import 'package:flexilayout/flexilayout.dart';
import 'package:flexilayout/src/layouts/flexi_dashboard/views/dashboard_desktop_veiw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget implements LayoutType {
  const Dashboard({
    super.key,
    required this.sideMenu,
    this.sideMenuStatus = SideMenuStatus.expanded,
    this.sideMenuPosition = SideMenuPosition.besidesTopBar,
  });
  final SideMenu sideMenu;
  final SideMenuStatus sideMenuStatus;
  final SideMenuPosition sideMenuPosition;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FlexiDashboardCubit(
        sideMenuPosition: sideMenuPosition,
        sideMenuStatus: sideMenuStatus,
        menuData: sideMenu.menuData,
        defaultPage: sideMenu.defaultPage,
      ),
      child: DashboardDesktopView(
        sideMenu: sideMenu,
      ),
    );
  }
}
