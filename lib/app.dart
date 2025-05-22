import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/cities_screen.dart';
import 'screens/attractions_screen.dart';
import 'screens/attraction_detail_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/about_screen.dart';
import 'screens/search_screen.dart';
import 'screens/favourites_screen.dart';
import 'blocs/theme_bloc.dart';

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'WanderMate',
          debugShowCheckedModeBanner: false,
          theme: state.themeData,
          initialRoute: '/splash',
          routes: {
            '/splash': (_) => const SplashScreen(),
            '/login': (_) => const LoginScreen(),
            '/home': (_) => const HomeScreen(),
            '/cities': (_) => const CitiesScreen(),
            '/attractions': (_) => const AttractionsScreen(),
            '/attractionDetail': (_) => const AttractionDetailScreen(),
            '/settings': (_) => const SettingsScreen(),
            '/about': (_) => const AboutScreen(),
            '/search': (_) => const SearchScreen(),
            '/favourites': (_) => const FavouritesScreen(),
          },
        );
      },
    );
  }
}
