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
          sideMenu: SideMenu(
            menuData: MenuData(
              sections: [
                MenuSection(
                  title: 'Section 1',
                  items: [
                    MenuItem(
                      icon: Icons.home,
                      name: 'Home',
                      page: const Center(child: Text('Home')),
                    ),
                    MenuItem(
                      icon: Icons.settings,
                      name: 'Settings',
                      page: const Center(child: Text('Settings')),
                    ),
                  ],
                ),
                MenuSection(
                  title: 'Section 2',
                  items: [
                    MenuItem(
                      icon: Icons.home,
                      name: 'Home',
                      page: const Center(child: Text('Home')),
                    ),
                    MenuItem(
                      icon: Icons.settings,
                      name: 'Settings',
                      page: const Center(child: Text('Settings')),
                    ),
                  ],
                ),
              ],
              items: [
                MenuItem(
                  icon: Icons.home,
                  name: 'Home',
                  page: const Center(child: Text('Home')),
                ),
                MenuItem(
                  icon: Icons.settings,
                  name: 'Settings',
                  page: const Center(child: Text('Settings')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
