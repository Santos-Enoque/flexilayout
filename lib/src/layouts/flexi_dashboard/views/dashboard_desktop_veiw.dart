// ignore_for_file: lines_longer_than_80_chars

import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represents the desktop view of the dashboard.
///
/// The `DashboardDesktopView` class is a stateless widget that displays the desktop view of the dashboard.
/// It consists of an app bar, a side menu, and the main content area.
class DashboardDesktopView extends StatelessWidget {
  /// Creates a `DashboardDesktopView` instance.
  ///
  /// The `DashboardDesktopView` constructor requires the following parameters:
  ///
  /// - `sideMenu`: The side menu widget to be displayed.
  const DashboardDesktopView({
    super.key,
    required this.sideMenu,
  });

  /// The side menu widget to be displayed.
  final SideMenu sideMenu;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlexiDashboardCubit, FlexiDashboardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                context.read<FlexiDashboardCubit>().toggleSideMenu();
              },
            ),
            title: const Text('Flexilayout'),
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
              sideMenu,
              Expanded(
                child: state.pageMap[state.selectedItemId] ?? state.defaultPage,
              ),
            ],
          ),
        );
      },
    );
  }
}
