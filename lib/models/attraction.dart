class Attraction {
  final String name;
  final String image;
  final String description;
  final String openingHours;
  final double price;
  final double? lat;
  final double? lng;
  final String? city; // nullable for backward compatibility
  final String? country; // nullable for backward compatibility
  final double? rating; // for future use if needed

  Attraction({
    required this.name,
    required this.image,
    required this.description,
    required this.openingHours,
    required this.price,
    this.lat,
    this.lng,
    this.city,
    this.country,
    this.rating,
  });

  factory Attraction.fromJson(
    Map<String, dynamic> json, {
    String? city,
    String? country,
  }) {
    return Attraction(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      openingHours: json['opening_hours'],
      price: (json['price'] as num).toDouble(),
      lat: json['lat'] != null ? (json['lat'] as num).toDouble() : null,
      lng: json['lng'] != null ? (json['lng'] as num).toDouble() : null,
      city: city, // pass down from parent if available
      country: country, // pass down from parent if available
      rating:
          json['rating'] != null ? (json['rating'] as num).toDouble() : null,
    );
  }
}
