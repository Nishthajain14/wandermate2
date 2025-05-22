import 'attraction.dart';

class City {
  final String name;
  final String image;
  final String? description; // <-- Added
  final List<Attraction> attractions;

  City({
    required this.name,
    required this.image,
    this.description, // <-- Added
    required this.attractions,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    var attractionsList =
        (json['attractions'] as List)
            .map((a) => Attraction.fromJson(a))
            .toList();
    return City(
      name: json['name'],
      image: json['image'],
      description: json['description'], // <-- Added
      attractions: attractionsList,
    );
  }
}
