import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  Future<void> _handleLogout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Drawer(
      child: Column(
        children: [
          // Drawer header with logo and app name
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primary.withOpacity(0.93),
                  Colors.tealAccent.withOpacity(0.75),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // App logo (make sure this asset exists)
                  SizedBox(
                    height: 70,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "WanderMate",
                    style: GoogleFonts.pacifico(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Menu title with stylish font
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 6, bottom: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Menu",
                style: GoogleFonts.montserrat(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: primary,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          // Navigation options
          ListTile(
            leading: const Icon(Icons.home),
            title: Text("Home", style: GoogleFonts.montserrat(fontSize: 18)),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: Text(
              "Favourites",
              style: GoogleFonts.montserrat(fontSize: 18),
            ),
            onTap: () => Navigator.pushReplacementNamed(context, '/favourites'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              "Settings",
              style: GoogleFonts.montserrat(fontSize: 18),
            ),
            onTap: () => Navigator.pushReplacementNamed(context, '/settings'),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text("About", style: GoogleFonts.montserrat(fontSize: 18)),
            onTap: () => Navigator.pushReplacementNamed(context, '/about'),
          ),
          const Spacer(),
          // Logout option
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text(
              "Logout",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () => _handleLogout(context),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
