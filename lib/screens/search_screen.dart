import 'package:flutter/material.dart';
import '../models/country.dart';
import '../repositories/data_repository.dart';
import '../widgets/country_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Country> _allCountries = [];
  List<Country> _filteredCountries = [];

  @override
  void initState() {
    super.initState();
    DataRepository().loadCountries().then((countries) {
      setState(() {
        _allCountries = countries;
        _filteredCountries = countries;
      });
    });
    _controller.addListener(_search);
  }

  void _search() {
    final query = _controller.text.toLowerCase();
    setState(() {
      _filteredCountries =
          _allCountries
              .where((c) => c.name.toLowerCase().contains(query))
              .toList();
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_search);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Countries')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCountries.length,
              itemBuilder:
                  (context, idx) => CountryTile(
                    country: _filteredCountries[idx],
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/cities',
                        arguments: _filteredCountries[idx],
                      );
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
