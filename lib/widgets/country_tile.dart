import 'package:flutter/material.dart';
import '../models/country.dart';

class CountryTile extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const CountryTile({Key? key, required this.country, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        country.image,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(country.name),
      onTap: onTap,
    );
  }
}
