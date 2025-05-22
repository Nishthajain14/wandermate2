import 'package:flutter/material.dart';
import '../models/city.dart';
import '../models/attraction.dart';

class AttractionsScreen extends StatelessWidget {
  const AttractionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final City city = ModalRoute.of(context)!.settings.arguments as City;
    return Scaffold(
      appBar: AppBar(title: Text('Top Attractions in ${city.name}')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemCount: city.attractions.length,
        itemBuilder: (context, idx) {
          final Attraction attraction = city.attractions[idx];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/attractionDetail',
                arguments: attraction,
              );
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14),
                      bottomLeft: Radius.circular(14),
                    ),
                    child: Image.asset(
                      attraction.image,
                      width: 110,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          attraction.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          "€${attraction.price.toStringAsFixed(2)}",
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(color: Colors.teal),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 18),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
