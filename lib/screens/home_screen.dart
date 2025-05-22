import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/data_repository.dart';
import '../models/country.dart';
import '../blocs/favourites_bloc.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/country_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('WanderMate'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            tooltip: "Favourites",
            onPressed: () {
              Navigator.pushNamed(context, '/favourites');
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Country>>(
        future: DataRepository().loadCountries(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final countries = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'home-hero',
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    child: Image.asset(
                      "assets/images/hero_world.png",
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Favourites Section
                BlocBuilder<FavouritesBloc, FavouritesState>(
                  builder: (context, favState) {
                    final hasFavourites =
                        favState.countries.isNotEmpty ||
                        favState.cities.isNotEmpty ||
                        favState.attractions.isNotEmpty;

                    if (!hasFavourites) return const SizedBox.shrink();

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Your Favourites",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 110,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                // Favourite Countries
                                ...favState.countries.map(
                                  (country) => Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/cities',
                                          arguments: country,
                                        );
                                      },
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  country.image,
                                                  width: 60,
                                                  height: 60,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              SizedBox(
                                                width: 70,
                                                child: Text(
                                                  country.name,
                                                  style:
                                                      Theme.of(
                                                        context,
                                                      ).textTheme.bodySmall,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.flag,
                                                size: 16,
                                                color: Colors.deepPurple,
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            top: 4,
                                            right: 4,
                                            child: BlocBuilder<
                                              FavouritesBloc,
                                              FavouritesState
                                            >(
                                              builder: (context, favState) {
                                                final isFavourited = favState
                                                    .countries
                                                    .any(
                                                      (c) =>
                                                          c.name ==
                                                          country.name,
                                                    );
                                                return GestureDetector(
                                                  onTap: () {
                                                    context
                                                        .read<FavouritesBloc>()
                                                        .add(
                                                          ToggleCountryFavourite(
                                                            country,
                                                          ),
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
                                                    size: 22,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // Favourite Cities
                                ...favState.cities.map(
                                  (city) => Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.asset(
                                                city.image,
                                                width: 60,
                                                height: 60,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            SizedBox(
                                              width: 70,
                                              child: Text(
                                                city.name,
                                                style:
                                                    Theme.of(
                                                      context,
                                                    ).textTheme.bodySmall,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.location_city,
                                              size: 16,
                                              color: Colors.teal,
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          top: 4,
                                          right: 4,
                                          child: BlocBuilder<
                                            FavouritesBloc,
                                            FavouritesState
                                          >(
                                            builder: (context, favState) {
                                              final isFavourited = favState
                                                  .cities
                                                  .any(
                                                    (c) => c.name == city.name,
                                                  );
                                              return GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<FavouritesBloc>()
                                                      .add(
                                                        ToggleCityFavourite(
                                                          city,
                                                        ),
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
                                                  size: 22,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Favourite Attractions
                                ...favState.attractions.map(
                                  (a) => Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.asset(
                                                a.image,
                                                width: 60,
                                                height: 60,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            SizedBox(
                                              width: 70,
                                              child: Text(
                                                a.name,
                                                style:
                                                    Theme.of(
                                                      context,
                                                    ).textTheme.bodySmall,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.amber,
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          top: 4,
                                          right: 4,
                                          child: BlocBuilder<
                                            FavouritesBloc,
                                            FavouritesState
                                          >(
                                            builder: (context, favState) {
                                              final isFavourited = favState
                                                  .attractions
                                                  .any(
                                                    (att) => att.name == a.name,
                                                  );
                                              return GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<FavouritesBloc>()
                                                      .add(
                                                        ToggleAttractionFavourite(
                                                          a,
                                                        ),
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
                                                  size: 22,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(height: 24),
                        ],
                      ),
                    );
                  },
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Explore Countries",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 260,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      final country = countries[index];
                      return SizedBox(
                        width: 220,
                        child: CountryTile(
                          country: country,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/cities',
                              arguments: country,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
