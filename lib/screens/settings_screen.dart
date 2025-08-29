import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return SwitchListTile(
                title: const Text('Dark Mode'),
                subtitle: const Text('Toggle between light and dark theme'),
                value: themeProvider.themeMode == ThemeMode.dark,
                onChanged: (_) => themeProvider.toggleTheme(),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Configure notification settings'),
            leading: const Icon(Icons.notifications),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to notification settings
            },
          ),
          ListTile(
            title: const Text('Export Data'),
            subtitle: const Text('Export your tasks as JSON'),
            leading: const Icon(Icons.download),
            onTap: () {
              // Implement export functionality
            },
          ),
          ListTile(
            title: const Text('About'),
            subtitle: const Text('Version 1.0.0'),
            leading: const Icon(Icons.info),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Todo App',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2023 Todo App',
              );
            },
          ),
        ],
      ),
    );
  }
}