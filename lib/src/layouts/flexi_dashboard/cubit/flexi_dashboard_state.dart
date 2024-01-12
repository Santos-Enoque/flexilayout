// ignore_for_file: lines_longer_than_80_chars

part of 'flexi_dashboard_cubit.dart';

/// Represents the status of the side menu.
///
/// The `SideMenuStatus` enum defines three possible states for the side menu: expanded, collapsed, and unCollapsable.
enum SideMenuStatus {
  /// Represents the expanded state of the side menu.
  expanded,

  /// Represents the collapsed state of the side menu.
  collapsed,

  /// Represents the unCollapsable state of the side menu. It basically means the side menu cannot be collapsed.
  unCollapsable,
}

enum SideMenuPosition {
  underTopBar,
  besidesTopBar,
}

/// Represents the state of the FlexiDashboard.
///
/// The `FlexiDashboardState` class is an immutable class that holds the state of the FlexiDashboard.
/// It includes the status of the side menu, the default page, the page map, the selected item ID, and the hovered item ID.
class FlexiDashboardState extends Equatable {
  /// Creates a `FlexiDashboardState` instance.
  ///
  /// The `FlexiDashboardState` constructor requires the following parameters:
  ///
  /// - `sideMenuStatus`: The status of the side menu.
  /// - `defailtPage`: The default page to display.
  /// - `pageMap`: A map of item IDs to their corresponding pages.
  /// - `selectedItemId`: The ID of the currently selected item.
  /// - `hoveredItemId`: The ID of the currently hovered item.
  const FlexiDashboardState({
    required this.sideMenuStatus,
    required this.defaultPage,
    required this.pageMap,
    required this.selectedItemId,
    required this.hoveredItemId,
    required this.sideMenuPosition,
  });

  /// The status of the side menu.
  final SideMenuStatus sideMenuStatus;
  
  /// The position of the side menu.
  final SideMenuPosition sideMenuPosition;

  /// The default page to display.
  final Widget defaultPage;

  /// A map of item IDs to their corresponding pages.
  final Map<String, Widget> pageMap;

  /// The ID of the currently selected item.
  final String? selectedItemId;

  /// The ID of the currently hovered item.
  final String? hoveredItemId;

  /// The currently displayed page.
  Widget get currentPage => pageMap[selectedItemId] ?? defaultPage;

  /// Creates a copy of the `FlexiDashboardState` with updated values.
  ///
  /// The `copyWith` method allows creating a new `FlexiDashboardState` instance with updated values.
  /// It accepts optional parameters for each property and returns a new `FlexiDashboardState` instance with the updated values.
  FlexiDashboardState copyWith({
    SideMenuStatus? sideMenuStatus,
    Widget? defaultPage,
    Map<String, Widget>? pageMap,
    String? selectedItemId,
    String? hoveredItemId,
  }) {
    return FlexiDashboardState(
      sideMenuPosition: sideMenuPosition,
      sideMenuStatus: sideMenuStatus ?? this.sideMenuStatus,
      defaultPage: defaultPage ?? this.defaultPage,
      pageMap: pageMap ?? this.pageMap,
      selectedItemId: selectedItemId ?? this.selectedItemId,
      hoveredItemId: hoveredItemId ?? this.hoveredItemId,
    );
  }

  @override
  List<Object?> get props => [
        sideMenuStatus,
        defaultPage,
        pageMap,
        selectedItemId,
        hoveredItemId,
      ];
}
