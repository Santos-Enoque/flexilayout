import 'package:flutter/material.dart';
import 'package:flutter_admin_panel/flutter_admin_panel.dart';
import 'package:flutter_admin_panel/src/bloc/admin_panel_bloc.dart';
import 'package:flutter_admin_panel/src/widgets/top_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobideView extends StatelessWidget {
  const MobideView({super.key});

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
