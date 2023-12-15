import 'package:flutter/material.dart';
import 'package:flutter_admin_panel/flutter_admin_panel.dart';
import 'package:flutter_admin_panel/src/bloc/admin_panel_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenuSection extends StatelessWidget {
  const SideMenuSection({
    Key? key,
    this.name,
    required this.items,
    required this.priority,
  })  : assert(priority > 0, 'Position starts from 1'),
        super(key: key);

  /// Name of the menu section
  ///
  /// if it's null the section will be displayed with no name
  final String? name;

  /// Priority of the [SideMenuSection] is the position of the section
  /// in the side-menu
  ///
  /// The lower the priority value the higher the position of the section
  /// within the side-menu. This value should be unique and start from 1
  final int priority;

  /// Elements that are part of a given section of the side menu
  final List<SideMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (name != null && state.sideMenuStatus.isExpanded())
              ListTile(
                title: Text(
                  name!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: items,
            ),
          ],
        );
      },
    );
  }
}
