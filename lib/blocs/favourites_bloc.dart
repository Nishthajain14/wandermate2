// lib/blocs/favourites_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/country.dart';
import '../models/city.dart';
import '../models/attraction.dart';

// Events
abstract class FavouritesEvent {}

class ToggleCountryFavourite extends FavouritesEvent {
  final Country country;
  ToggleCountryFavourite(this.country);
}

class ToggleCityFavourite extends FavouritesEvent {
  final City city;
  ToggleCityFavourite(this.city);
}

class ToggleAttractionFavourite extends FavouritesEvent {
  final Attraction attraction;
  ToggleAttractionFavourite(this.attraction);
}

// State
class FavouritesState {
  final List<Country> countries;
  final List<City> cities;
  final List<Attraction> attractions;
  FavouritesState({
    this.countries = const [],
    this.cities = const [],
    this.attractions = const [],
  });

  FavouritesState copyWith({
    List<Country>? countries,
    List<City>? cities,
    List<Attraction>? attractions,
  }) => FavouritesState(
    countries: countries ?? this.countries,
    cities: cities ?? this.cities,
    attractions: attractions ?? this.attractions,
  );
}

// Bloc
class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesState()) {
    on<ToggleCountryFavourite>((event, emit) {
      final countries = List<Country>.from(state.countries);
      if (countries.any((c) => c.name == event.country.name)) {
        countries.removeWhere((c) => c.name == event.country.name);
      } else {
        countries.add(event.country);
      }
      emit(state.copyWith(countries: countries));
    });

    on<ToggleCityFavourite>((event, emit) {
      final cities = List<City>.from(state.cities);
      if (cities.any((c) => c.name == event.city.name)) {
        cities.removeWhere((c) => c.name == event.city.name);
      } else {
        cities.add(event.city);
      }
      emit(state.copyWith(cities: cities));
    });

    on<ToggleAttractionFavourite>((event, emit) {
      final attractions = List<Attraction>.from(state.attractions);
      if (attractions.any((a) => a.name == event.attraction.name)) {
        attractions.removeWhere((a) => a.name == event.attraction.name);
      } else {
        attractions.add(event.attraction);
      }
      emit(state.copyWith(attractions: attractions));
    });
  }

  bool isCountryFavourited(Country country) =>
      state.countries.any((c) => c.name == country.name);
  bool isCityFavourited(City city) =>
      state.cities.any((c) => c.name == city.name);
  bool isAttractionFavourited(Attraction attraction) =>
      state.attractions.any((a) => a.name == attraction.name);
}
