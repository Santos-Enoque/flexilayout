import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class AdminPanelBloc extends Bloc<AdminPanelEvent, DashboardState> {
  AdminPanelBloc({
    required SideMenuStatus sideMenuStatus,
    required AdminPanelRepository repository,
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
    on<AdminPanelSideMenuTogglePressed>(_onAdminPanelSideMenuToggledPressed);
    on<AdminPanelSideMenuInitialized>(_onAdminPanelSideMenuInitialized);
    on<AdminPanelSideMenuItemCllicked>(_onAdminPanelSideMenuItemClicked);
    on<AdminPanelSideMenuItemHovered>(_onAdminPanelSideMenuItemHovered);
    on<AdminPanelSideMenuItemHoverExited>(
      _onAdminPanelSideMenuItemHoveredExited,
    );
    on<AdminPanelCursorEnteredContententSection>(
      _onAdminPanelCursorEnteredContentSection,
    );
  }

  final AdminPanelRepository _repository;

  void _onAdminPanelSideMenuInitialized(
    AdminPanelSideMenuInitialized event,
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
    AdminPanelSideMenuTogglePressed event,
    Emitter<DashboardState> emit,
  ) {
    state.sideMenuStatus == SideMenuStatus.expanded
        ? emit(state.copyWith(sideMenuStatus: SideMenuStatus.minimized))
        : emit(state.copyWith(sideMenuStatus: SideMenuStatus.expanded));
  }

  void _onAdminPanelCursorEnteredContentSection(
    AdminPanelCursorEnteredContententSection event,
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
    AdminPanelSideMenuItemHovered event,
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
    AdminPanelSideMenuItemHoverExited event,
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
    AdminPanelSideMenuItemCllicked event,
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
