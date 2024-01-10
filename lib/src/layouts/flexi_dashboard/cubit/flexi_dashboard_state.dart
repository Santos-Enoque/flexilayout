part of 'flexi_dashboard_cubit.dart';

enum SideMenuStatus { expanded, collapsed }

class FlexiDashboardState extends Equatable {
  const FlexiDashboardState();

  final SideMenuStatus sideMenuStatus = SideMenuStatus.expanded;
  final Map<String, Widget> pageMap;
  final String? selectedItemId;
  final String? hoveredItemId;
  


  @override
  List<Object> get props => [];
}


