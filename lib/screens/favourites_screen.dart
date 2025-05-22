import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/favourites_bloc.dart';
import '../models/country.dart';
import '../models/city.dart';
import '../models/attraction.dart';
import '../widgets/custom_drawer.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(title: const Text('Your Favourites')),
      body: BlocBuilder<FavouritesBloc, FavouritesState>(
        builder: (context, favState) {
          final hasFavourites =
              favState.countries.isNotEmpty ||
              favState.cities.isNotEmpty ||
              favState.attractions.isNotEmpty;

          if (!hasFavourites) {
            return const Center(
              child: Text(
                "You haven't added any favourites yet!",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (favState.countries.isNotEmpty) ...[
                const Text(
                  'Favourite Countries',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                ...favState.countries.map(
                  (country) => _FavouriteCountryTile(country: country),
                ),
                const Divider(height: 32),
              ],
              if (favState.cities.isNotEmpty) ...[
                const Text(
                  'Favourite Cities',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                ...favState.cities.map(
                  (city) => _FavouriteCityTile(city: city),
                ),
                const Divider(height: 32),
              ],
              if (favState.attractions.isNotEmpty) ...[
                const Text(
                  'Favourite Attractions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                ...favState.attractions.map(
                  (attraction) =>
                      _FavouriteAttractionTile(attraction: attraction),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _FavouriteCountryTile extends StatelessWidget {
  final Country country;
  const _FavouriteCountryTile({required this.country});

  @override
  Widget build(BuildContext context) {
    final isFavourited = context.select<FavouritesBloc, bool>(
      (bloc) => bloc.state.countries.any((c) => c.name == country.name),
    );
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/cities', arguments: country);
        },
        child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: Image.asset(
                    country.image,
                    width: 74,
                    height: 74,
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
                          country.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (country.description != null &&
                            country.description!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              country.description!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 14,
              child: GestureDetector(
                onTap: () {
                  context.read<FavouritesBloc>().add(
                    ToggleCountryFavourite(country),
                  );
                },
                child: Icon(
                  isFavourited ? Icons.favorite : Icons.favorite_border,
                  color: isFavourited ? Colors.red : Colors.grey[400],
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavouriteCityTile extends StatelessWidget {
  final City city;
  const _FavouriteCityTile({required this.city});

  @override
  Widget build(BuildContext context) {
    final isFavourited = context.select<FavouritesBloc, bool>(
      (bloc) => bloc.state.cities.any((c) => c.name == city.name),
    );
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/attractions', arguments: city);
        },
        child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: Image.asset(
                    city.image,
                    width: 74,
                    height: 74,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          city.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (city.description != null &&
                            city.description!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              city.description!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 14,
              child: GestureDetector(
                onTap: () {
                  context.read<FavouritesBloc>().add(ToggleCityFavourite(city));
                },
                child: Icon(
                  isFavourited ? Icons.favorite : Icons.favorite_border,
                  color: isFavourited ? Colors.red : Colors.grey[400],
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavouriteAttractionTile extends StatelessWidget {
  final Attraction attraction;
  const _FavouriteAttractionTile({required this.attraction});

  @override
  Widget build(BuildContext context) {
    final isFavourited = context.select<FavouritesBloc, bool>(
      (bloc) => bloc.state.attractions.any((a) => a.name == attraction.name),
    );
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/attractionDetail',
            arguments: attraction,
          );
        },
        child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: Image.asset(
                    attraction.image,
                    width: 74,
                    height: 74,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          attraction.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            attraction.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 14,
              child: GestureDetector(
                onTap: () {
                  context.read<FavouritesBloc>().add(
                    ToggleAttractionFavourite(attraction),
                  );
                },
                child: Icon(
                  isFavourited ? Icons.favorite : Icons.favorite_border,
                  color: isFavourited ? Colors.red : Colors.grey[400],
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
