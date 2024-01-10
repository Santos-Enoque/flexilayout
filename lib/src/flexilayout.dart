// ignore_for_file: public_member_api_docs, must_be_immutable

import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template flexilayout}
/// A Flutter modern admin panel that can easily added to your app
/// {@endtemplate}
class FlexiLayout extends StatelessWidget {
  FlexiLayout({
    super.key,
    required this.sections,
    this.sideMenuStatus = SideMenuStatus.expanded,
  }) : assert(sections.isNotEmpty, 'Sections cannot be empty');

  final List<SideMenuSection> sections;
  SideMenuStatus sideMenuStatus;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (context) => DashboardBloc(
        repository: DashboardRepository(sideMenuSections: sections),
        sideMenuStatus: sideMenuStatus,
      )..add(DashboardSideMenuInitialized()),
      child: const Responsive(
        mobile: MobileView(),
        desktop: DesktopView(),
        tablet: TabletView(),
      ),
    );
  }
}
