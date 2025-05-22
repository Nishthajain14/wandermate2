import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/theme_bloc.dart';
import '../widgets/custom_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeBloc = BlocProvider.of<ThemeBloc>(context);

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('About'),
            subtitle: const Text('Your personal info'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder:
                (context, state) => SwitchListTile(
                  title: const Text('Light/Dark Mode'),
                  value: state.isDarkMode,
                  onChanged: (_) {
                    themeBloc.add(ToggleThemeEvent());
                  },
                ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {
              // Remove all previous routes and go to login
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil('/login', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
