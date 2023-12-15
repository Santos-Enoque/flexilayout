import 'package:flutter/material.dart';
import 'package:flutter_admin_panel/flutter_admin_panel.dart';
import 'package:flutter_admin_panel/src/bloc/admin_panel_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultSideMenuLogo extends StatelessWidget {
  const DefaultSideMenuLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminPanelBloc, AdminPanelState>(
      builder: (context, state) {
        return Row(
          children: [
            const Logo(),
            if (state.sideMenuStatus.isExpanded())
              const SizedBox(
                width: 10,
              ),
            if (state.sideMenuStatus.isExpanded())
              const Text(
                'Cytop',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              )
          ],
        );
      },
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        child: Icon(
          Icons.dashboard_customize_rounded,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
