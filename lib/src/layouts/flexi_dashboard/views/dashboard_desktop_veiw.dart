import 'package:flexilayout/flexilayout.dart';
import 'package:flexilayout/src/shared/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represents the desktop view of the dashboard.
///
/// The `DashboardDesktopView` class is a stateless widget that
/// displays the desktop view of the dashboard.
/// It consists of an app bar, a side menu, and the main content area.
class DashboardDesktopView extends StatelessWidget {
  /// Creates a `DashboardDesktopView` instance.
  ///
  /// The `DashboardDesktopView` constructor requires the following parameters:
  ///
  /// - `leftSideMenu`: The side menu widget to be displayed on the left.
  /// - `rightSideMenu`: The side menu widget to be displayed on the right.
  const DashboardDesktopView({
    super.key,
    required this.leftSideMenu,
    required this.rightSideMenu,
  });

  /// The side menu widget to be displayed.
  final SideMenu leftSideMenu;

  /// The side menu widget to be displayed.
  final SideMenu rightSideMenu;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlexiDashboardCubit, FlexiDashboardState>(
      builder: (context, state) {
        final themeMode = Theme.of(context).brightness;
        final leftSideMenuStatus = state.leftSideMenuStatus;
        final rightSideMenuStatus = state.rightSideMenuStatus;
        return Scaffold(
          appBar: AppBar(
            actions: [
              CustomIconButton(
                iconPath:
                    _getIconPath(themeMode, leftSideMenuStatus, isLeft: true),
                onPressed: () {
                  context.read<FlexiDashboardCubit>().toggleLeftSideMenu();
                },
              ),
              CustomIconButton(
                iconPath:
                    _getIconPath(themeMode, rightSideMenuStatus, isLeft: false),
                onPressed: () {
                  context.read<FlexiDashboardCubit>().toggleRightSideMenu();
                },
              ),
              const SizedBox(width: 10),
            ],
            title: const Text('Flexilayout'),
            centerTitle: false,
            elevation: .4,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1), // Height of the border
              child: Container(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black.withOpacity(0.4)
                    : Colors.white.withOpacity(0.4), // Color of the border
                height: 0.2, // Height of the border
              ),
            ),
          ),
          body: Row(
            children: [
              leftSideMenu,
              Expanded(
                child: state.pageMap[state.selectedItemId] ?? state.defaultPage,
              ),
              rightSideMenu,
            ],
          ),
        );
      },
    );
  }

  String _getIconPath(
    Brightness brightness,
    SideMenuStatus sideMenuStatus, {
    required bool isLeft,
  }) {
    if (isLeft) {
      return brightness == Brightness.light
          ? sideMenuStatus == SideMenuStatus.expanded
              ? CustomIcons.leftSideMenuHide
              : CustomIcons.leftSideMenuShow
          : sideMenuStatus == SideMenuStatus.expanded
              ? CustomIcons.leftSideMenuHideDark
              : CustomIcons.leftSideMenuShowDark;
    } else {
      // Assuming you have similar logic for right side menu icons
      return brightness == Brightness.light
          ? sideMenuStatus == SideMenuStatus.expanded
              ? CustomIcons.rightSideMenuHide
              : CustomIcons.rightSideMenuShow
          : sideMenuStatus == SideMenuStatus.expanded
              ? CustomIcons.rightSideMenuHideDark
              : CustomIcons.rightSideMenuShowDark;
    }
  }
}
