import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardDesktopView extends StatelessWidget {
  const DashboardDesktopView({
    super.key,
    required this.sideMenu,
  });
  final SideMenu sideMenu;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlexiDashboardCubit, FlexiDashboardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                context.read<FlexiDashboardCubit>().toggleSideMenu();
              },
            ),
            title: const Text('Flexilayout'),
            elevation: .4,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1), // Height of the border
              child: Container(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black.withOpacity(0.4)
                    : Colors.white.withOpacity(0.4), // Color of the border
                height: 0.2, // Height of the border
              ),
            ),
          ),
          body: Row(
            children: [
              sideMenu,
              Expanded(
                  child:
                      state.pageMap[state.selectedItemId] ?? state.defaultPage)
            ],
          ),
        );
      },
    );
  }
}
