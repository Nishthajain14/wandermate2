import 'package:flutter/material.dart';
import '../models/attraction.dart';

class AttractionTile extends StatelessWidget {
  final Attraction attraction;
  final VoidCallback onTap;

  const AttractionTile({
    Key? key,
    required this.attraction,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        attraction.image,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(attraction.name),
      subtitle: Text('€${attraction.price.toStringAsFixed(2)}'),
      onTap: onTap,
    );
  }
}
