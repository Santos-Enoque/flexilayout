import 'package:dashboard/counter/counter.dart';
import 'package:dashboard/l10n/l10n.dart';
import 'package:flexilayout/flexilayout.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: FlutterAdminPanel(
        sections: [
          SideMenuSection(
            priority: 1,
            name: 'Section title',
            items: [
              SideMenuItem(
                isExpandable: true,
                subItems: [
                  SideMenuSubItem(
                    priority: 1,
                    name: 'First Sub-Item',
                    page: const Center(child: Text('First Sub-Item Page')),
                  ),
                  SideMenuSubItem(
                    priority: 2,
                    name: 'Second Sub-Item',
                    page: const Center(child: Text('Second Sub-Item Page')),
                  ),
                  SideMenuSubItem(
                    priority: 3,
                    name: 'Third Sub-Item',
                    page: const Center(child: Text('Third Sub-Item Page')),
                  ),
                ],
                icon: Icons.bar_chart_outlined,
                name: 'Projects',
                priority: 1,
              ),
              SideMenuItem(
                icon: Icons.text_snippet,
                name: 'Single Item',
                priority: 2,
                page: const Center(child: Text('Single Item Page')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
