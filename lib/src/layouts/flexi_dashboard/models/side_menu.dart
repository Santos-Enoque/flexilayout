// ignore_for_file: lines_longer_than_80_chars, require_trailing_commas

import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Represents the side menu component.
///
/// The `SideMenu` class is a stateless widget that displays the side menu of the application.
/// It provides a drawer with a list of menu sections and items, allowing users to navigate through the application.
class SideMenu extends StatelessWidget {
  /// Creates a `SideMenu` instance.
  ///
  /// The `SideMenu` constructor requires the following parameters:
  ///
  /// - `menuData`: The data for the menu, including sections and items.
  /// - `content`: The content widget to be displayed alongside the side menu.
  /// - `defaultPage`: The default page widget to be displayed when no menu item is selected.
  /// - `sideMenuStatus`: The initial status of the side menu (expanded, collapsed, or unCollapsable).
  /// - `collapseSideMenuCompletely`: Whether the side menu should collapse completely when collapsed.
  /// - `sideMenuWidthExpanded`: The width of the side menu when expanded.
  /// - `sideMenuWidthCollapsed`: The width of the side menu when collapsed.
  /// - `animationDurationMilliseconds`: The duration of the animation when expanding or collapsing the side menu.
  const SideMenu(
      {super.key,
      this.menuData,
      this.content,
      this.defaultPage,
      this.sideMenuStatus = SideMenuStatus.expanded,
      this.collapseSideMenuCompletely = false,
      this.sideMenuWidthExpanded = 280,
      this.sideMenuWidthCollapsed = 70,
      this.animationDurationMilliseconds = 300,
      this.backgroundColor})
      : assert(
          menuData != null || content != null,
          'Either menuData or content must be provided.',
        ),
        assert(
          content == null || defaultPage != null,
          'A defaultPage must be provided when content is not null.',
        );

  /// The data for the menu, including sections and items.
  final MenuData? menuData;

  /// The content widget to be displayed alongside the side menu.
  final Widget? content;

  /// The default page widget to be displayed when no menu item is selected.
  final Widget? defaultPage;

  /// The initial status of the side menu (expanded, collapsed, or unCollapsable).
  final SideMenuStatus sideMenuStatus;

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlexiDashboardCubit, FlexiDashboardState>(
      buildWhen: (previous, current) =>
          previous.sideMenuStatus != current.sideMenuStatus &&
          previous.sideMenuStatus != SideMenuStatus.unCollapsable,
      builder: (context, state) {
        return AnimatedContainer(
          duration: Duration(milliseconds: animationDurationMilliseconds),
          width: state.sideMenuStatus == SideMenuStatus.unCollapsable
              ? sideMenuWidthExpanded
              : state.sideMenuStatus == SideMenuStatus.expanded
                  ? sideMenuWidthExpanded
                  : collapseSideMenuCompletely
                      ? 0
                      : sideMenuWidthCollapsed,
          decoration: BoxDecoration(
            // color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
            border: Border(
              right: BorderSide(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black.withOpacity(0.4)
                    : Colors.white.withOpacity(0.4), // Color of the border
                width: .4,
              ),
            ),
          ),
          child: ListView(
            children: [
              if (menuData?.sections != null)
                for (final section in menuData!.sections!)
                  ExpansionTile(
                    leading: Icon(section.icon),
                    title: Text(
                      state.sideMenuStatus == SideMenuStatus.collapsed
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
                  ListTile(
                    leading: Icon(item.icon),
                    title: Text(
                      state.sideMenuStatus == SideMenuStatus.collapsed
                          ? ''
                          : item.name,
                    ),
                    onTap: () {
                      context.read<FlexiDashboardCubit>().selectItem(item.id);
                    },
                  ),
            ],
          ),
        );
      },
    );
  }
}
