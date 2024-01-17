import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';

part 'flexi_dashboard_state.dart';

/// Represents the Cubit for the FlexiDashboard state management.
///
/// The `FlexiDashboardCubit` class extends the `Cubit` class and
/// manages the state of the FlexiDashboard.
/// It handles the side menu status, position, default page, and selected item.
class FlexiDashboardCubit extends Cubit<FlexiDashboardState> {
  /// Creates a `FlexiDashboardCubit` instance.
  ///
  /// The `FlexiDashboardCubit` constructor requires the following parameters:
  ///
  /// - `menuData`: The data for the menu, including sections and items.
  /// - `defaultPage`: The default page widget to be displayed when
  /// no menu item is selected.
  /// - `sideMenuStatus`: The initial status of the side menu
  /// (expanded or collapsed).
  /// - `sideMenuPosition`: The position of the side menu in
  /// relation to the top bar.
  ///
  /// It also asserts that either `menuData` or `defaultPage` is provided.
  FlexiDashboardCubit({
    this.menuData,
    this.defaultPage,
    required this.rightSideMenuStatus,
    required this.sideMenuPosition,
    required this.leftSideMenuStatus,
  })  : assert(
          menuData != null || defaultPage != null,
          'menuData and defaultPage cannot both be null.',
        ),
        super(
          FlexiDashboardState(
            sideMenuPosition: sideMenuPosition,
            rightSideMenuStatus: rightSideMenuStatus,
            leftSideMenuStatus: leftSideMenuStatus,
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
  final SideMenuStatus rightSideMenuStatus;

  /// The initial status of the side menu (expanded or collapsed).
  final SideMenuStatus leftSideMenuStatus;

  /// The position of the side menu in relation to the top bar.
  final SideMenuPosition sideMenuPosition;

  /// Toggles the side menu between expanded and collapsed states.
  void toggleRightSideMenu() {
    if (state.rightSideMenuStatus == SideMenuStatus.collapsed) {
      emit(state.copyWith(rightSideMenuStatus: SideMenuStatus.expanded));
    } else if (state.rightSideMenuStatus == SideMenuStatus.expanded) {
      emit(state.copyWith(rightSideMenuStatus: SideMenuStatus.collapsed));
    }
  }

  /// Toggles the side menu between expanded and collapsed states.
  void toggleLeftSideMenu() {
    if (state.leftSideMenuStatus == SideMenuStatus.collapsed) {
      emit(state.copyWith(leftSideMenuStatus: SideMenuStatus.expanded));
    } else if (state.leftSideMenuStatus == SideMenuStatus.expanded) {
      emit(state.copyWith(leftSideMenuStatus: SideMenuStatus.collapsed));
    }
  }

  /// Selects an item in the side menu.
  ///
  /// The `itemId` parameter specifies the ID of the item to be selected.
  void selectItem(String itemId) {
    emit(state.copyWith(selectedItemId: itemId));
  }
}
