// ignore_for_file: lines_longer_than_80_chars

import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represents the side menu component.
///
/// The `SideMenu` class is a stateless widget that displays the side menu of the application.
/// It provides a list of menu items and handles the selection of menu items.
class SideMenu extends StatelessWidget {
  /// Creates a `SideMenu` instance.
  ///
  /// The `SideMenu` constructor does not require any parameters.
  const SideMenu({
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
              const Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(child: LogoContainer()),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children:
                      context.read<DashboardBloc>().state.sideMenuSections,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
