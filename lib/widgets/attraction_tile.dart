import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/attraction.dart';
import '../blocs/favourites_bloc.dart';

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
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, favState) {
        final isFavourited = favState.attractions.any(
          (a) => a.name == attraction.name,
        );

        return GestureDetector(
          onTap: onTap,
          child: Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
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
                        width: 100,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              attraction.name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '€${attraction.price.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(color: Colors.teal),
                            ),
                            const SizedBox(height: 6),
                            // Ratings Row
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  (attraction.rating != null)
                                      ? attraction.rating!.toStringAsFixed(1)
                                      : "-",
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 36), // space for heart
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
                      isFavourited ? Icons.favorite : Icons.favorite_border,
                      color: isFavourited ? Colors.red : Colors.grey[400],
                      size: 26,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
