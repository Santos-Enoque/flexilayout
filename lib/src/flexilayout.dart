// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flexilayout/flexilayout.dart';
import 'package:flexilayout/src/layouts/dashboard/repositories/admin_panel_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template flexilayout}
/// A Flutter modern admin panel that can easily added to your app
/// {@endtemplate}
class FlutterAdminPanel extends StatelessWidget {
  FlutterAdminPanel(
      {super.key,
      required this.sections,
      this.sideMenuStatus = SideMenuStatus.expanded})
      : assert(sections.isNotEmpty, 'Sections cannot be empty');

  final List<SideMenuSection> sections;
  SideMenuStatus sideMenuStatus;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminPanelBloc>(
      create: (context) => AdminPanelBloc(
        repository: AdminPanelRepository(sideMenuSections: sections),
        sideMenuStatus: sideMenuStatus,
      )..add(AdminPanelSideMenuInitialized()),
      child: const Responsive(
        mobile: MobideView(),
        desktop: DesktopView(),
        tablet: TabletView(),
      ),
    );
  }
}
