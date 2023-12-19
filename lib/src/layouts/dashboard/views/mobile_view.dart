
// ignore_for_file: lines_longer_than_80_chars

import 'package:flexilayout/flexilayout.dart';
import 'package:flexilayout/src/layouts/dashboard/widgets/top_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/// Represents the mobile view of the application.
///
/// The `MobileView` widget is used to display the mobile version of the application.
/// It takes no additional parameters and renders the content specific to the mobile view.
///
/// Example usage:
///
/// ```dart
/// MobileView(),
/// ```
class MobileView extends StatelessWidget {
  /// Creates a `MobileView` widget.
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      builder: (context, state) {
        return Scaffold(
          appBar: topNavBar(context),
          body: state.pages.isEmpty
              ? Container()
              : state.pages[
                  state.idsOfItemsWithPages.indexOf(state.sideMenuActiveItem)],
        );
      },
    );
  }
}
