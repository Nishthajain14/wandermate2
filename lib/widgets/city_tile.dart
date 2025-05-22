import 'package:flutter/material.dart';
import '../models/city.dart';

class CityTile extends StatelessWidget {
  final City city;
  final VoidCallback onTap;

  const CityTile({Key? key, required this.city, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        city.image,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(city.name),
      onTap: onTap,
    );
  }
}
