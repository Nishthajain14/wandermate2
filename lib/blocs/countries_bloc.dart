import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/country.dart';
import '../repositories/data_repository.dart';

// Events
abstract class CountriesEvent {}

class LoadCountries extends CountriesEvent {}

class SearchCountries extends CountriesEvent {
  final String query;
  SearchCountries(this.query);
}

// States
abstract class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesLoaded extends CountriesState {
  final List<Country> countries;
  CountriesLoaded(this.countries);
}

class CountriesError extends CountriesState {
  final String message;
  CountriesError(this.message);
}

// CountriesBloc
class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final DataRepository repository;

  CountriesBloc(this.repository) : super(CountriesInitial()) {
    on<LoadCountries>((event, emit) async {
      emit(CountriesLoading());
      try {
        final countries = await repository.loadCountries();
        emit(CountriesLoaded(countries));
      } catch (e) {
        emit(CountriesError(e.toString()));
      }
    });

    on<SearchCountries>((event, emit) async {
      emit(CountriesLoading());
      try {
        final countries = await repository.loadCountries();
        final filtered =
            countries
                .where(
                  (c) =>
                      c.name.toLowerCase().contains(event.query.toLowerCase()),
                )
                .toList();
        emit(CountriesLoaded(filtered));
      } catch (e) {
        emit(CountriesError(e.toString()));
      }
    });
  }
}
