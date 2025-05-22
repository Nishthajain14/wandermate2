import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeEvent {}

class LoadThemeEvent extends ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}

class ThemeState {
  final ThemeData themeData;
  final bool isDarkMode;

  ThemeState({required this.themeData, required this.isDarkMode});
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
    : super(ThemeState(themeData: ThemeData.light(), isDarkMode: false)) {
    on<LoadThemeEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool('isDarkMode') ?? false;
      emit(
        ThemeState(
          themeData: isDark ? ThemeData.dark() : ThemeData.light(),
          isDarkMode: isDark,
        ),
      );
    });

    on<ToggleThemeEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final isDark = !(state.isDarkMode);
      await prefs.setBool('isDarkMode', isDark);
      emit(
        ThemeState(
          themeData: isDark ? ThemeData.dark() : ThemeData.light(),
          isDarkMode: isDark,
        ),
      );
    });
  }
}
