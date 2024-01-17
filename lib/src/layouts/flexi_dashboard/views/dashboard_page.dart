import 'package:flexilayout/flexilayout.dart';
import 'package:flexilayout/src/layouts/flexi_dashboard/views/dashboard_desktop_veiw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represents the dashboard page.
///
/// The `Dashboard` class is a stateless widget that serves as the main
///  dashboard page.
/// It provides a customizable side menu, side menu status, and side 
/// menu position.
class Dashboard extends StatelessWidget implements LayoutType {
  /// Creates a `Dashboard` instance.
  ///
  /// The `Dashboard` constructor requires the following parameters:
  ///
  /// - `sideMenu`: The side menu widget to be displayed.
  /// - `sideMenuStatus`: The initial status of the side menu 
  /// (expanded or collapsed).
  /// - `sideMenuPosition`: The position of the side menu in 
  /// relation to the top bar.
  const Dashboard({
    super.key,
    required this.sideMenu,
    this.sideMenuStatus = SideMenuStatus.expanded,
    this.sideMenuPosition = SideMenuPosition.besidesTopBar,
  });

  /// The side menu widget to be displayed.
  final SideMenu sideMenu;

  /// The initial status of the side menu (expanded or collapsed).
  final SideMenuStatus sideMenuStatus;

  /// The position of the side menu in relation to the top bar.
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
