import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/attraction.dart';
import '../blocs/favourites_bloc.dart';

class AttractionDetailScreen extends StatelessWidget {
  const AttractionDetailScreen({Key? key}) : super(key: key);

  Future<void> _openMap(BuildContext context, Attraction attraction) async {
    String url;
    if (attraction.lat != null && attraction.lng != null) {
      url =
          'https://www.google.com/maps/search/?api=1&query=${attraction.lat},${attraction.lng}';
    } else {
      final encodedName = Uri.encodeComponent(attraction.name);
      url = 'https://www.google.com/maps/search/?api=1&query=$encodedName';
    }
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Could not open map.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Attraction attraction =
        ModalRoute.of(context)!.settings.arguments as Attraction;
    return Scaffold(
      appBar: AppBar(
        title: Text(attraction.name),
        actions: [
          BlocBuilder<FavouritesBloc, FavouritesState>(
            builder: (context, favState) {
              final isFavourited = favState.attractions.any(
                (a) => a.name == attraction.name,
              );
              return IconButton(
                icon: Icon(
                  isFavourited ? Icons.favorite : Icons.favorite_border,
                  color: isFavourited ? Colors.red : Colors.white,
                ),
                tooltip:
                    isFavourited
                        ? "Remove from Favourites"
                        : "Add to Favourites",
                onPressed: () {
                  context.read<FavouritesBloc>().add(
                    ToggleAttractionFavourite(attraction),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Hero(
                  tag: attraction.image,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    child: Image.asset(
                      attraction.image,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 24,
                  child: BlocBuilder<FavouritesBloc, FavouritesState>(
                    builder: (context, favState) {
                      final isFavourited = favState.attractions.any(
                        (a) => a.name == attraction.name,
                      );
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            context.read<FavouritesBloc>().add(
                              ToggleAttractionFavourite(attraction),
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.80),
                            radius: 22,
                            child: Icon(
                              isFavourited
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  isFavourited ? Colors.red : Colors.grey[600],
                              size: 26,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        attraction.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.euro, color: Colors.teal, size: 22),
                          const SizedBox(width: 8),
                          Text(
                            "Ticket Price: €${attraction.price.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: Colors.teal,
                            size: 22,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Opening hours: ${attraction.openingHours}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        attraction.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => _openMap(context, attraction),
                        icon: const Icon(Icons.map),
                        label: const Text('View on Map'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
