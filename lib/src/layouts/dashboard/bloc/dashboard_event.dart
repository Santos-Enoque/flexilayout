// ignore_for_file: lines_longer_than_80_chars

part of 'dashboard_bloc.dart';

/// Represents an abstract event in the dashboard.
///
/// The `DashboardEvent` class is an abstract class that serves as the base class for all events in the dashboard.
/// It provides the `props` method for equatable comparison.
abstract class DashbaordEvent extends Equatable {
  /// Returns a list of properties used for equatable comparison.
  ///
  /// By default, the `props` method returns an empty list.
  /// Subclasses can override this method to include their own properties for comparison.
  const DashbaordEvent();

  @override
  List<Object> get props => [];
}
/// Represents an event triggered when the side menu toggle button is pressed.
///
/// The `DashboardSideMenuTogglePressed` class is a subclass of `DashboardEvent` that represents an event
/// triggered when the side menu toggle button is pressed. This event can be used to handle the logic
/// associated with toggling the visibility of the side menu.
class DashboardSideMenuTogglePressed extends DashbaordEvent {}

/// Represents an event triggered when the side menu is initialized.
///
/// The `DashboardSideMenuInitialized` class is a subclass of `DashboardEvent` that represents an event
/// triggered when the side menu is initialized. This event can be used to handle the logic associated
/// with setting up the initial state of the side menu.
class DashboardSideMenuInitialized extends DashbaordEvent {}

/// Represents an event triggered when the cursor enters a content section.
///
/// The `DashboardCursorEnteredContentSection` class is a subclass of `DashboardEvent` that represents
/// an event triggered when the cursor enters a content section. This event can be used to handle the
/// logic associated with displaying additional information or performing actions when the cursor enters
/// a specific section of the dashboard content.
class DashboardCursorEnteredContententSection extends DashbaordEvent {}

/// Represents an event triggered when a side menu item is hovered.
///
/// The `DashboardSideMenuItemHovered` class is a subclass of `DashboardEvent` that represents an event
/// triggered when a side menu item is hovered. This event can be used to handle the logic associated
/// with displaying additional information or performing actions when a side menu item is hovered.
class DashboardSideMenuItemHovered extends DashbaordEvent {
  /// Creates a `DashboardSideMenuItemHovered` event.
  ///
  /// The `DashboardSideMenuItemHovered` constructor requires the following parameters:
  ///
  /// - `id`: The ID of the hovered side menu item.
  /// - `isPopUpMenuItem`: A flag indicating whether the hovered item is a pop-up menu item.
  const DashboardSideMenuItemHovered({
    required this.id,
    this.isPopUpMenuItem = false,
  });

  /// The ID of the hovered side menu item.
  final String id;

  /// A flag indicating whether the hovered item is a pop-up menu item.
  final bool isPopUpMenuItem;

  @override
  List<Object> get props => [id, isPopUpMenuItem];
}

/// Represents an event triggered when a side menu item is clicked.
///
/// The `DashboardSideMenuItemClicked` class is a subclass of `DashboardEvent` that represents an event
/// triggered when a side menu item is clicked. This event can be used to handle the logic associated
/// with performing actions when a side menu item is clicked.
class DashboardSideMenuItemClicked extends DashbaordEvent {
  /// Creates a `DashboardSideMenuItemClicked` event.
  ///
  /// The `DashboardSideMenuItemClicked` constructor requires the following parameter:
  ///
  /// - `id`: The ID of the clicked side menu item.
  const DashboardSideMenuItemClicked(this.id);

  /// The ID of the clicked side menu item.
  final String id;

  @override
  List<Object> get props => [id];
}

/// Represents an event triggered when the cursor exits a side menu item.
///
/// The `DashboardMenuItemHoverExited` class is a subclass of `DashboardEvent` that represents an event
/// triggered when the cursor exits a side menu item. This event can be used to handle the logic associated
/// with hiding additional information or performing actions when the cursor exits a specific side menu item.
class DashboardMenuItemHoverExited extends DashbaordEvent {
  /// Creates a `DashboardMenuItemHoverExited` event.
  ///
  /// The `DashboardMenuItemHoverExited` constructor requires the following parameters:
  ///
  /// - `id`: The ID of the side menu item.
  /// - `isPopUpMenuItem`: A flag indicating whether the side menu item is a pop-up menu item.
  const DashboardMenuItemHoverExited({
    required this.id,
    this.isPopUpMenuItem = false,
  });

  /// The ID of the side menu item.
  final String id;

  /// A flag indicating whether the side menu item is a pop-up menu item.
  final bool isPopUpMenuItem;

  @override
  List<Object> get props => [id, isPopUpMenuItem];
}
