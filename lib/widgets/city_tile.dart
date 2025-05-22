import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/city.dart';
import '../blocs/favourites_bloc.dart';

class CityTile extends StatelessWidget {
  final City city;
  final VoidCallback onTap;

  const CityTile({Key? key, required this.city, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, favState) {
        final isFavourited = favState.cities.any((c) => c.name == city.name);

        return GestureDetector(
          onTap: onTap,
          child: Card(
            elevation: 4,
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
                        city.image,
                        width: 100,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: Text(
                          city.name,
                          style: Theme.of(context).textTheme.titleMedium,
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
                        ToggleCityFavourite(city),
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
