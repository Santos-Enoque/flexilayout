// ignore_for_file: lines_longer_than_80_chars

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

/// Represents the business logic component for the dashboard.
///
/// The `DashboardBloc` class is responsible for managing the state and handling events related to the dashboard.
/// It extends the `Bloc` class from the `flutter_bloc` package and defines the initial state and event handlers.
class DashboardBloc extends Bloc<DashbaordEvent, DashboardState> {
  /// Creates a `DashboardBloc` instance.
  ///
  /// The `DashboardBloc` constructor requires the following parameters:
  ///
  /// - `sideMenuStatus`: The initial status of the side menu.
  /// - `repository`: An instance of the `AdminPanelRepository` that provides data and operations for the dashboard.
  DashboardBloc({
    required SideMenuStatus sideMenuStatus,
    required DashboardRepository repository,
  })  : _repository = repository,
        super(
          DashboardState(
            pages: const [],
            idsOfItemsWithPages: const [],
            sideMenuItems: const [],
            sideMenuItemBeingHovered: '',
            sideMenuActiveItem: '',
            lastSideMenuItemHovered: '',
            popUpSideMenuItemElementBeingHovered: '',
            activePopUpSideMenuId: '',
            sideMenuStatus: sideMenuStatus,
            sideMenuSections: repository.sideMenuSections,
          ),
        ) {
    on<DashboardSideMenuTogglePressed>(_onAdminPanelSideMenuToggledPressed);
    on<DashboardSideMenuInitialized>(_onAdminPanelSideMenuInitialized);
    on<DashboardSideMenuItemClicked>(_onAdminPanelSideMenuItemClicked);
    on<DashboardSideMenuItemHovered>(_onAdminPanelSideMenuItemHovered);
    on<DashboardMenuItemHoverExited>(
      _onAdminPanelSideMenuItemHoveredExited,
    );
    on<DashboardCursorEnteredContententSection>(
      _onAdminPanelCursorEnteredContentSection,
    );
  }

  final DashboardRepository _repository;

  void _onAdminPanelSideMenuInitialized(
    DashboardSideMenuInitialized event,
    Emitter<DashboardState> emit,
  ) {
    final positions = _repository.getIdOfItemsWithPages();
    final items = _repository.getSideMenuItems();
    final pages = _repository.getPages();
    emit(
      state.copyWith(
        idsOfItemsWithPages: positions,
        sideMenuActiveItem: positions[0],
        sideMenuItems: items,
        pages: pages,
      ),
    );
  }

  void _onAdminPanelSideMenuToggledPressed(
    DashboardSideMenuTogglePressed event,
    Emitter<DashboardState> emit,
  ) {
    state.sideMenuStatus == SideMenuStatus.expanded
        ? emit(state.copyWith(sideMenuStatus: SideMenuStatus.minimized))
        : emit(state.copyWith(sideMenuStatus: SideMenuStatus.expanded));
  }

  void _onAdminPanelCursorEnteredContentSection(
    DashboardCursorEnteredContententSection event,
    Emitter<DashboardState> emit,
  ) {
    emit(
      state.copyWith(
        sideMenuItemBeingHovered: '',
        activePopUpSideMenuId: '',
        popUpSideMenuItemElementBeingHovered: '',
      ),
    );
  }

  void _onAdminPanelSideMenuItemHovered(
    DashboardSideMenuItemHovered event,
    Emitter<DashboardState> emit,
  ) {
    emit(
      state.copyWith(
        lastSideMenuItemHovered: event.id,
        sideMenuItemBeingHovered: event.id,
        // popUpSideMenuItemElementBeingHovered: event.id,
        activePopUpSideMenuId:
            state.sideMenuStatus.isExpanded() ? '' : event.id,
      ),
    );
  }

  void _onAdminPanelSideMenuItemHoveredExited(
    DashboardMenuItemHoverExited event,
    Emitter<DashboardState> emit,
  ) {
    if (state.sideMenuStatus.isExpanded()) {
      emit(state.copyWith(sideMenuItemBeingHovered: ''));
    } else {
      final itemHasPage =
          state.idsOfItemsWithPages.any((element) => element == event.id);

      if (itemHasPage && !event.isPopUpMenuItem) {
        emit(state.copyWith(sideMenuItemBeingHovered: ''));
      }

      if (itemHasPage && event.isPopUpMenuItem) {
        log('something');
      }
    }
  }

  void _onAdminPanelSideMenuItemClicked(
    DashboardSideMenuItemClicked event,
    Emitter<DashboardState> emit,
  ) {
    emit(
      state.copyWith(
        sideMenuItemBeingHovered: '',
        sideMenuActiveItem: event.id,
      ),
    );
  }
}
