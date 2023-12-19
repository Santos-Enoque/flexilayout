part of 'admin_panel_bloc.dart';

abstract class AdminPanelEvent extends Equatable {
  const AdminPanelEvent();

  @override
  List<Object> get props => [];
}

class AdminPanelSideMenuTogglePressed extends AdminPanelEvent {}

class AdminPanelSideMenuInitialized extends AdminPanelEvent {}

class AdminPanelCursorEnteredContententSection extends AdminPanelEvent {}

class AdminPanelSideMenuItemHovered extends AdminPanelEvent {
  AdminPanelSideMenuItemHovered(
      {required this.id, this.isPopUpMenuItem = false});

  final String id;

  final bool isPopUpMenuItem;

  @override
  List<Object> get props => [id, isPopUpMenuItem];
}

class AdminPanelSideMenuItemCllicked extends AdminPanelEvent {
  AdminPanelSideMenuItemCllicked(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

class AdminPanelSideMenuItemHoverExited extends AdminPanelEvent {
  AdminPanelSideMenuItemHoverExited(
      {required this.id, this.isPopUpMenuItem = false});

  final String id;

  final bool isPopUpMenuItem;

  @override
  List<Object> get props => [id, isPopUpMenuItem];
}
