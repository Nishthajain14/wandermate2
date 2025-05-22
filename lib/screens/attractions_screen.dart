import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/city.dart';
import '../models/attraction.dart';
import '../blocs/favourites_bloc.dart';

class AttractionsScreen extends StatelessWidget {
  const AttractionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final City city = ModalRoute.of(context)!.settings.arguments as City;
    return Scaffold(
      appBar: AppBar(title: Text('Top Attractions in ${city.name}')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const SizedBox(height: 18),
        itemCount: city.attractions.length,
        itemBuilder: (context, idx) {
          final Attraction attraction = city.attractions[idx];
          return BlocBuilder<FavouritesBloc, FavouritesState>(
            builder: (context, favState) {
              final isFavourited = favState.attractions.any(
                (a) => a.name == attraction.name,
              );

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
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            ),
                            child: Image.asset(
                              attraction.image,
                              width: 110,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    attraction.name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "€${attraction.price.toStringAsFixed(2)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(color: Colors.teal),
                                  ),
                                  const SizedBox(height: 8),
                                  // Rating Row (NEW)
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        (attraction.rating != null)
                                            ? attraction.rating!
                                                .toStringAsFixed(1)
                                            : "-",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleMedium?.copyWith(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 36), // Space for heart icon
                        ],
                      ),
                      Positioned(
                        top: 8,
                        right: 12,
                        child: GestureDetector(
                          onTap: () {
                            context.read<FavouritesBloc>().add(
                              ToggleAttractionFavourite(attraction),
                            );
                          },
                          child: Icon(
                            isFavourited
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavourited ? Colors.red : Colors.grey[400],
                            size: 26,
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 10,
                        bottom: 10,
                        child: Icon(Icons.arrow_forward_ios, size: 17),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
