import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/country.dart';

class DataRepository {
  Future<List<Country>> loadCountries() async {
    final data = await rootBundle.loadString('assets/data/countries.json');
    final List countriesJson = json.decode(data);
    return countriesJson.map((e) => Country.fromJson(e)).toList();
  }
}
