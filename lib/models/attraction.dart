class Attraction {
  final String name;
  final String image;
  final String description;
  final String openingHours;
  final double price;

  Attraction({
    required this.name,
    required this.image,
    required this.description,
    required this.openingHours,
    required this.price,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      openingHours: json['opening_hours'],
      price: json['price'].toDouble(),
    );
  }
}
