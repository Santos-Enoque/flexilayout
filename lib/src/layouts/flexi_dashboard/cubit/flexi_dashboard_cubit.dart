import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'flexi_dashboard_state.dart';

class FlexiDashboardCubit extends Cubit<FlexiDashboardState> {
  FlexiDashboardCubit() : super(FlexiDashboardInitial());
}
