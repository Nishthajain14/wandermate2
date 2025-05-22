class Attraction {
  final String name;
  final String image;
  final String description;
  final String openingHours;
  final double price;
  final double? lat;
  final double? lng;

  Attraction({
    required this.name,
    required this.image,
    required this.description,
    required this.openingHours,
    required this.price,
    this.lat,
    this.lng,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      openingHours: json['opening_hours'],
      price: (json['price'] as num).toDouble(),
      lat: json['lat'] != null ? (json['lat'] as num).toDouble() : null,
      lng: json['lng'] != null ? (json['lng'] as num).toDouble() : null,
    );
  }
}
