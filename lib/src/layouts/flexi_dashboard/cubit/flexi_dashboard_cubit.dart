// ignore_for_file: lines_longer_than_80_chars

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';

part 'flexi_dashboard_state.dart';

/// Represents the Cubit for the FlexiDashboard state management.
///
/// The `FlexiDashboardCubit` class extends the `Cubit` class and manages the state of the FlexiDashboard.
/// It handles the side menu status, position, default page, and selected item.
class FlexiDashboardCubit extends Cubit<FlexiDashboardState> {
  /// Creates a `FlexiDashboardCubit` instance.
  ///
  /// The `FlexiDashboardCubit` constructor requires the following parameters:
  ///
  /// - `menuData`: The data for the menu, including sections and items.
  /// - `defaultPage`: The default page widget to be displayed when no menu item is selected.
  /// - `sideMenuStatus`: The initial status of the side menu (expanded or collapsed).
  /// - `sideMenuPosition`: The position of the side menu in relation to the top bar.
  ///
  /// It also asserts that either `menuData` or `defaultPage` is provided.
  FlexiDashboardCubit({
    this.menuData,
    this.defaultPage,
    required this.sideMenuStatus,
    required this.sideMenuPosition,
  })  : assert(
          menuData != null || defaultPage != null,
          'menuData and defaultPage cannot both be null.',
        ),
        super(
          FlexiDashboardState(
            sideMenuPosition: sideMenuPosition,
            sideMenuStatus: sideMenuStatus,
            defaultPage: defaultPage ??
                menuData?.sections?.first.items.first.page ??
                menuData!.items!.first.page,
            pageMap: menuData?.pageMap ?? {},
            selectedItemId: '',
            hoveredItemId: '',
          ),
        );

  /// The data for the menu, including sections and items.
  final MenuData? menuData;

  /// The default page widget to be displayed when no menu item is selected.
  final Widget? defaultPage;

  /// The initial status of the side menu (expanded or collapsed).
  final SideMenuStatus sideMenuStatus;

  /// The position of the side menu in relation to the top bar.
  final SideMenuPosition sideMenuPosition;

  /// Toggles the side menu between expanded and collapsed states.
  void toggleSideMenu() {
    if (state.sideMenuStatus == SideMenuStatus.collapsed) {
      emit(state.copyWith(sideMenuStatus: SideMenuStatus.expanded));
    } else if (state.sideMenuStatus == SideMenuStatus.expanded) {
      emit(state.copyWith(sideMenuStatus: SideMenuStatus.collapsed));
    }
  }

  /// Selects an item in the side menu.
  ///
  /// The `itemId` parameter specifies the ID of the item to be selected.
  void selectItem(String itemId) {
    emit(state.copyWith(selectedItemId: itemId));
  }
}
