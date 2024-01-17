import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represents the side menu component.
///
/// The `SideMenu` class is a stateless widget that displays the
/// side menu of the application.
/// It provides a drawer with a list of menu sections and items, allowing
/// users to navigate through the application.
class SideMenu extends StatelessWidget {
  /// Creates a `SideMenu` instance.
  ///
  /// The `SideMenu` constructor requires the following parameters:
  ///
  /// - `menuData`: The data for the menu, including sections and items.
  /// - `content`: The content widget to be displayed alongside the side menu.
  /// - `defaultPage`: The default page widget to be displayed when
  /// no menu item is selected.
  /// - `sideMenuStatus`: The initial status of the side menu
  /// (expanded, collapsed, or unCollapsable).
  /// - `collapseSideMenuCompletely`: Whether the side menu should collapse
  /// completely when collapsed.
  /// - `sideMenuWidthExpanded`: The width of the side menu when expanded.
  /// - `sideMenuWidthCollapsed`: The width of the side menu when collapsed.
  /// - `animationDurationMilliseconds`: The duration of the animation when
  /// expanding or collapsing the side menu.
  const SideMenu({
    super.key,
    this.menuData,
    this.child,
    this.defaultPage,
    this.collapseSideMenuCompletely = true,
    this.sideMenuWidthExpanded = 280,
    this.sideMenuWidthCollapsed = 70,
    this.animationDurationMilliseconds = 20,
    this.isLeft = true,
    this.backgroundColor,
  })  : assert(
          menuData != null || child != null,
          'Either menuData or child must be provided.',
        ),
        assert(
          menuData == null || defaultPage != null || isLeft,
          'A defaultPage must be provided when menuData is not null.',
        );

  /// The data for the menu, including sections and items.
  final MenuData? menuData;

  /// The content widget to be displayed alongside the side menu.
  final Widget? child;

  /// The default page widget to be displayed when no menu item is selected.
  final Widget? defaultPage;

  /// Whether the side menu should collapse completely when collapsed.
  final bool collapseSideMenuCompletely;

  /// The width of the side menu when expanded.
  final double sideMenuWidthExpanded;

  /// The width of the side menu when collapsed.
  final double sideMenuWidthCollapsed;

  /// The duration of the animation when expanding or collapsing the side menu.
  final int animationDurationMilliseconds;

  /// The background color of the side menu.
  final Color? backgroundColor;

  /// The position of the side menu
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlexiDashboardCubit, FlexiDashboardState>(
      buildWhen: (previous, current) {
        if (isLeft) {
          return previous.leftSideMenuStatus != current.leftSideMenuStatus &&
              previous.leftSideMenuStatus != SideMenuStatus.unCollapsable;
        } else {
          return previous.rightSideMenuStatus != current.rightSideMenuStatus &&
              previous.rightSideMenuStatus != SideMenuStatus.unCollapsable;
        }
      },
      builder: (context, state) {
        final borderSide = BorderSide(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black.withOpacity(0.4)
              : Colors.white.withOpacity(0.4), // Color of the border
          width: .4,
        );

        final sideMenuStatus =
            isLeft ? state.leftSideMenuStatus : state.rightSideMenuStatus;
        return AnimatedContainer(
          duration: Duration(milliseconds: animationDurationMilliseconds),
          width: _getWidth(state),
          decoration: BoxDecoration(
            border: !isLeft
                ? Border(
                    left: borderSide,
                  )
                : Border(
                    right: borderSide,
                  ),
          ),
          child: menuData == null
              ? AnimatedOpacity(
                  duration: Duration(
                    milliseconds: animationDurationMilliseconds + 200,
                  ),
                  opacity: sideMenuStatus == SideMenuStatus.collapsed ? 0 : 1,
                  child: sideMenuStatus == SideMenuStatus.collapsed
                      ? Container()
                      : child,
                )
              : AnimatedOpacity(
                  duration: Duration(
                    milliseconds: animationDurationMilliseconds + 200,
                  ),
                  opacity: sideMenuStatus == SideMenuStatus.collapsed ? 0 : 1,
                  child: ListView(
                    children: [
                      if (menuData?.sections != null)
                        for (final section in menuData!.sections!)
                          if (collapseSideMenuCompletely &&
                              sideMenuStatus == SideMenuStatus.collapsed)
                            Container()
                          else
                            ExpansionTile(
                              leading: Icon(section.icon),
                              title: Text(
                                sideMenuStatus == SideMenuStatus.collapsed
                                    ? ''
                                    : section.title,
                              ),
                              children: [
                                for (final item in section.items)
                                  ListTile(
                                    title: Text(item.name),
                                    onTap: () {
                                      context
                                          .read<FlexiDashboardCubit>()
                                          .selectItem(item.id);
                                    },
                                  ),
                              ],
                            ),
                      if (menuData?.items != null)
                        for (final item in menuData!.items!)
                          if (collapseSideMenuCompletely &&
                              sideMenuStatus == SideMenuStatus.collapsed)
                            Container()
                          else
                            ListTile(
                              leading: Icon(item.icon),
                              title: Text(
                                sideMenuStatus == SideMenuStatus.collapsed
                                    ? ''
                                    : item.name,
                              ),
                              onTap: () {
                                context
                                    .read<FlexiDashboardCubit>()
                                    .selectItem(item.id);
                              },
                            ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  double _getWidth(FlexiDashboardState state) {
    final condition = isLeft
        ? state.leftSideMenuStatus == SideMenuStatus.collapsed
        : state.rightSideMenuStatus == SideMenuStatus.collapsed;
    if (condition) {
      return collapseSideMenuCompletely ? 0 : sideMenuWidthCollapsed;
    } else {
      return sideMenuWidthExpanded;
    }
  }
}
