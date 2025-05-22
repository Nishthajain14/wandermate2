import 'city.dart';

class Country {
  final String name;
  final String image;
  final String? description;
  final List<City> cities;

  Country({
    required this.name,
    required this.image,
    this.description,
    required this.cities,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    var citiesList =
        (json['cities'] as List).map((city) => City.fromJson(city)).toList();
    return Country(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      cities: citiesList,
    );
  }
}
