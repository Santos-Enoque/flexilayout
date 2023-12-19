part of 'admin_panel_bloc.dart';

enum SideMenuStatus { expanded, minimized }

extension SideMenuStatusExt on SideMenuStatus {
  bool isExpanded() {
    switch (this) {
      case SideMenuStatus.expanded:
        return true;
      default:
        return false;
    }
  }
}

class AdminPanelState extends Equatable {
  const AdminPanelState(
      {required this.pages,
      required this.activePopUpSideMenuId,
      required this.popUpSideMenuItemElementBeingHovered,
      required this.lastSideMenuItemHovered,
      required this.sideMenuItems,
      required this.sideMenuActiveItem,
      required this.idsOfItemsWithPages,
      required this.sideMenuItemBeingHovered,
      required this.sideMenuSections,
      required this.sideMenuStatus});

  /// Keeps track of [SideMenuStatus]
  ///
  /// it can take on two values either [SideMenuStatus.expanded] or
  /// [SideMenuStatus.minimized] when the [AdminPanelSideMenu] is expanded or
  /// collapsed respectivelly
  final SideMenuStatus sideMenuStatus;
  final List<SideMenuSection> sideMenuSections;
  final List<MenuItem> sideMenuItems;
  final List<String> idsOfItemsWithPages;
  final String sideMenuItemBeingHovered;

  /// keeps track of [SideMenuSubItem]'s being hovered on the pop up menu
  final String popUpSideMenuItemElementBeingHovered;

  /// this variable is used to keep the SubMenu overlay active
  final String lastSideMenuItemHovered;
  final String sideMenuActiveItem;

  /// Keeps track of the currect active pop up side menu
  final String activePopUpSideMenuId;

  final List<Widget> pages;

  AdminPanelState copyWith({
    SideMenuStatus? sideMenuStatus,
    List<SideMenuSection>? sideMenuSections,
    List<MenuItem>? sideMenuItems,
    List<Widget>? pages,
    List<String>? idsOfItemsWithPages,
    String? sideMenuItemBeingHovered,
    String? sideMenuActiveItem,
    String? lastSideMenuItemHovered,
    String? popUpSideMenuItemElementBeingHovered,
    String? activePopUpSideMenuId,
  }) =>
      AdminPanelState(
          pages: pages ?? this.pages,
          activePopUpSideMenuId:
              activePopUpSideMenuId ?? this.activePopUpSideMenuId,
          popUpSideMenuItemElementBeingHovered:
              popUpSideMenuItemElementBeingHovered ??
                  this.popUpSideMenuItemElementBeingHovered,
          lastSideMenuItemHovered:
              lastSideMenuItemHovered ?? this.lastSideMenuItemHovered,
          sideMenuItems: sideMenuItems ?? this.sideMenuItems,
          sideMenuStatus: sideMenuStatus ?? this.sideMenuStatus,
          sideMenuSections: sideMenuSections ?? this.sideMenuSections,
          sideMenuItemBeingHovered:
              sideMenuItemBeingHovered ?? this.sideMenuItemBeingHovered,
          idsOfItemsWithPages: idsOfItemsWithPages ?? this.idsOfItemsWithPages,
          sideMenuActiveItem: sideMenuActiveItem ?? this.sideMenuActiveItem);

  @override
  List<Object> get props => [
        sideMenuStatus,
        sideMenuSections,
        sideMenuItemBeingHovered,
        idsOfItemsWithPages,
        lastSideMenuItemHovered,
        sideMenuActiveItem,
        sideMenuItems,
        pages
      ];
}
