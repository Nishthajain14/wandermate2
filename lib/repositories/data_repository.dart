import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/country.dart';
import '../models/attraction.dart';

class DataRepository {
  Future<List<Country>> loadCountries() async {
    final data = await rootBundle.loadString('assets/data/countries.json');
    final List countriesJson = json.decode(data);
    return countriesJson.map((e) => Country.fromJson(e)).toList();
  }

  /// Loads all attractions from countries.json and flattens to a single list.
  Future<List<Attraction>> loadAttractions() async {
    final data = await rootBundle.loadString('assets/data/countries.json');
    final List countriesJson = json.decode(data);

    final List<Attraction> attractions = [];
    for (final country in countriesJson) {
      final countryName = country['name'] ?? '';
      for (final city in (country['cities'] ?? [])) {
        final cityName = city['name'] ?? '';
        for (final a in (city['attractions'] ?? [])) {
          attractions.add(
            Attraction.fromJson(a, city: cityName, country: countryName),
          );
        }
      }
    }
    return attractions;
  }
}
