import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/screens/home_screen.dart';
import 'package:travel/screens/login_screen.dart';
import 'package:travel/screens/settings_screen.dart';
import 'package:travel/screens/about_screen.dart';
import 'package:travel/screens/cities_screen.dart';
import 'package:travel/screens/search_screen.dart';
import 'package:travel/screens/attractions_screen.dart';
import 'package:travel/screens/attraction_detail_screen.dart';
import 'package:travel/screens/favourites_screen.dart'; // <-- NEW: Import the Favourites screen
import 'blocs/theme_bloc.dart';
import 'blocs/favourites_bloc.dart'; // <-- NEW: Import the Favourites bloc
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc()..add(LoadThemeEvent()),
        ),
        BlocProvider<FavouritesBloc>(
          // <-- NEW: Provide the FavouritesBloc globally
          create: (_) => FavouritesBloc(),
        ),
      ],
      child: const TravelApp(),
    ),
  );
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WanderMate',
          theme: lightTealTheme,
          darkTheme: darkTealTheme,
          themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginScreen(),
            '/home': (context) => const HomeScreen(),
            '/settings': (context) => const SettingsScreen(),
            '/about': (context) => const AboutScreen(),
            '/cities': (context) => const CitiesScreen(),
            '/search': (context) => const SearchScreen(),
            '/attractions': (context) => const AttractionsScreen(),
            '/attractionDetail': (context) => const AttractionDetailScreen(),
            '/favourites':
                (context) =>
                    const FavouritesScreen(), // <-- NEW: Favourites screen route
            '/logout': (context) => const LoginScreen(),
            // Add any additional routes/screens here as needed
          },
        );
      },
    );
  }
}
