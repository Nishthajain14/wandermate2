import 'city.dart';

class Country {
  final String name;
  final String image;
  final String? description; // <-- Added
  final List<City> cities;

  Country({
    required this.name,
    required this.image,
    this.description, // <-- Added
    required this.cities,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    var citiesList =
        (json['cities'] as List).map((city) => City.fromJson(city)).toList();
    return Country(
      name: json['name'],
      image: json['image'],
      description: json['description'], // <-- Added
      cities: citiesList,
    );
  }
}
