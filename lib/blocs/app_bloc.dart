import 'package:flutter_bloc/flutter_bloc.dart';

// App Events
abstract class AppEvent {}

class AppStarted extends AppEvent {}

class AppLoggedOut extends AppEvent {}

// App States
abstract class AppState {}

class AppInitial extends AppState {}

class AppAuthenticated extends AppState {}

class AppUnauthenticated extends AppState {}

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppStarted>((event, emit) {
      // You could check authentication here
      emit(AppUnauthenticated());
    });

    on<AppLoggedOut>((event, emit) {
      emit(AppUnauthenticated());
    });
  }
}
