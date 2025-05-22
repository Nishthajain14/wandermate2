import 'package:flutter/material.dart';
import '../models/country.dart';
import '../models/city.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Country country =
        ModalRoute.of(context)!.settings.arguments as Country;
    return Scaffold(
      appBar: AppBar(title: Text(country.name)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const SizedBox(height: 18),
        itemCount: country.cities.length,
        itemBuilder: (context, idx) {
          final City city = country.cities[idx];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/attractions', arguments: city);
            },
            child: Card(
              elevation: 5,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // City Image (top)
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.asset(
                      city.image,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // City Name & Details (below the image)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          city.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        if (city.description != null &&
                            city.description!.isNotEmpty)
                          Text(
                            city.description!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
