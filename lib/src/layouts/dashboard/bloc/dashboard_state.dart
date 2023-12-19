// ignore_for_file: lines_longer_than_80_chars

part of 'dashboard_bloc.dart';
/// Represents the status of the side menu.
///
/// The `SideMenuStatus` enum defines two possible states for the side menu: expanded and minimized.
enum SideMenuStatus {
  /// Represents the expanded state of the side menu.
  expanded,

  /// Represents the minimized state of the side menu.
  minimized,
}

/// Extension on [SideMenuStatus] to check if the side menu is expanded.
extension SideMenuStatusExt on SideMenuStatus {
  /// Checks if the side menu status is expanded.
  ///
  /// Returns `true` if the side menu status is expanded, `false` otherwise.
  bool isExpanded() {
    switch (this) {
      case SideMenuStatus.expanded:
        return true;
      case SideMenuStatus.minimized:
        return false;
    }
  }
}

/// Represents the state of the dashboard.
///
/// The `DashboardState` class is an immutable class that holds the state of the dashboard.
/// It includes information such as the status of the side menu, the side menu sections and items,
/// the active side menu item, the hovered side menu item, and the pages being displayed.
class DashboardState extends Equatable {
    /// Creates a new instance of `DashboardState`.
  ///
  /// The `DashboardState` constructor requires the following parameters:
  ///
  /// - `sideMenuStatus`: The status of the side menu.
  /// - `sideMenuSections`: The sections of the side menu.
  /// - `sideMenuItems`: The items of the side menu.
  /// - `idsOfItemsWithPages`: The IDs of the items with pages.
  /// - `sideMenuItemBeingHovered`: The ID of the side menu item being hovered.
  /// - `popUpSideMenuItemElementBeingHovered`: The ID of the pop-up side menu item element being hovered.
  /// - `lastSideMenuItemHovered`: The ID of the last side menu item hovered.
  /// - `sideMenuActiveItem`: The ID of the active side menu item.
  /// - `activePopUpSideMenuId`: The ID of the active pop-up side menu.
  /// - `pages`: The pages being displayed.
  const DashboardState({
    required this.sideMenuStatus,
    required this.sideMenuSections,
    required this.sideMenuItems,
    required this.idsOfItemsWithPages,
    required this.sideMenuItemBeingHovered,
    required this.popUpSideMenuItemElementBeingHovered,
    required this.lastSideMenuItemHovered,
    required this.sideMenuActiveItem,
    required this.activePopUpSideMenuId,
    required this.pages,
  });

  /// The status of the side menu.
  final SideMenuStatus sideMenuStatus;

  /// The sections of the side menu.
  final List<SideMenuSection> sideMenuSections;

  /// The items of the side menu.
  final List<MenuItem> sideMenuItems;

  /// The IDs of the items with pages.
  final List<String> idsOfItemsWithPages;

  /// The ID of the side menu item being hovered.
  final String sideMenuItemBeingHovered;

  /// The ID of the pop-up side menu item element being hovered.
  final String popUpSideMenuItemElementBeingHovered;

  /// The ID of the last side menu item hovered.
  final String lastSideMenuItemHovered;

  /// The ID of the active side menu item.
  final String sideMenuActiveItem;

  /// The ID of the active pop-up side menu.
  final String activePopUpSideMenuId;

  /// The pages being displayed.
  final List<Widget> pages;

  /// Creates a copy of the `DashboardState` with the specified properties updated.
  DashboardState copyWith({
    SideMenuStatus? sideMenuStatus,
    List<SideMenuSection>? sideMenuSections,
    List<MenuItem>? sideMenuItems,
    List<String>? idsOfItemsWithPages,
    String? sideMenuItemBeingHovered,
    String? popUpSideMenuItemElementBeingHovered,
    String? lastSideMenuItemHovered,
    String? sideMenuActiveItem,
    String? activePopUpSideMenuId,
    List<Widget>? pages,
  }) {
    return DashboardState(
      sideMenuStatus: sideMenuStatus ?? this.sideMenuStatus,
      sideMenuSections: sideMenuSections ?? this.sideMenuSections,
      sideMenuItems: sideMenuItems ?? this.sideMenuItems,
      idsOfItemsWithPages: idsOfItemsWithPages ?? this.idsOfItemsWithPages,
      sideMenuItemBeingHovered:
          sideMenuItemBeingHovered ?? this.sideMenuItemBeingHovered,
      popUpSideMenuItemElementBeingHovered:
          popUpSideMenuItemElementBeingHovered ??
              this.popUpSideMenuItemElementBeingHovered,
      lastSideMenuItemHovered:
          lastSideMenuItemHovered ?? this.lastSideMenuItemHovered,
      sideMenuActiveItem: sideMenuActiveItem ?? this.sideMenuActiveItem,
      activePopUpSideMenuId: activePopUpSideMenuId ?? this.activePopUpSideMenuId,
      pages: pages ?? this.pages,
    );
  }

  @override
  List<Object> get props => [
        sideMenuStatus,
        sideMenuSections,
        sideMenuItems,
        idsOfItemsWithPages,
        sideMenuItemBeingHovered,
        popUpSideMenuItemElementBeingHovered,
        lastSideMenuItemHovered,
        sideMenuActiveItem,
        activePopUpSideMenuId,
        pages,
      ];
}
