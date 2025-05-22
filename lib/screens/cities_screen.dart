import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/country.dart';
import '../models/city.dart';
import '../blocs/favourites_bloc.dart';

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
          return BlocBuilder<FavouritesBloc, FavouritesState>(
            builder: (context, favState) {
              final isFavourited = favState.cities.any(
                (c) => c.name == city.name,
              );

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
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: Image.asset(
                              city.image,
                              height: 170,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                context.read<FavouritesBloc>().add(
                                  ToggleCityFavourite(city),
                                );
                              },
                              child: Icon(
                                isFavourited
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color:
                                    isFavourited
                                        ? Colors.red
                                        : Colors.grey[400],
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
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
          );
        },
      ),
    );
  }
}
