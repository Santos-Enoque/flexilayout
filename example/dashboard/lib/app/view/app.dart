import 'package:dashboard/l10n/l10n.dart';
import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: FlexiLayout(
        layout: Dashboard(
          rightSideMenu: const SideMenu(
            isLeft: false,
            child: Center(
              child: Text('Right Side Menu'),
            ),
          ),
          leftSideMenu: SideMenu(
            menuData: MenuData(
              items: [
                MenuItem(
                  icon: Icons.dashboard,
                  name: 'Dashboard',
                  page: const Center(child: Text('Dashboard')),
                ),
                MenuItem(
                  icon: Icons.devices,
                  name: 'Devices',
                  page: const Center(child: Text('Devices')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
