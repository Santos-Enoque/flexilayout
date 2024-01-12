import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';

part 'flexi_dashboard_state.dart';

class FlexiDashboardCubit extends Cubit<FlexiDashboardState> {
  FlexiDashboardCubit({
    this.menuData,
    this.defaultPage,
    required this.sideMenuStatus,
    required this.sideMenuPosition,
  })  : assert(menuData != null || defaultPage != null,
            "menuData and defaultPage cannot both be null."),
        super(FlexiDashboardState(
          sideMenuPosition: sideMenuPosition,
          sideMenuStatus: sideMenuStatus,
          defaultPage: defaultPage ??
              menuData?.sections?.first.items.first.page ??
              menuData!.items!.first.page,
          pageMap: menuData?.pageMap ?? {},
          selectedItemId: '',
          hoveredItemId: '',
        ));

  final MenuData? menuData;
  final Widget? defaultPage;
  final SideMenuStatus sideMenuStatus;
  final SideMenuPosition sideMenuPosition;

  void toggleSideMenu() {
    if (state.sideMenuStatus == SideMenuStatus.collapsed) {
      emit(state.copyWith(sideMenuStatus: SideMenuStatus.expanded));
    } else if (state.sideMenuStatus == SideMenuStatus.expanded) {
      emit(state.copyWith(sideMenuStatus: SideMenuStatus.collapsed));
    }
  }

  void selectItem(String itemId) {
    emit(state.copyWith(selectedItemId: itemId));
  }
}
