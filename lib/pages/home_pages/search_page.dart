import 'package:flutter/material.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<Widget> results = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.all(8),
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                )),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  results = Provider.of<AppProvider>(context,listen: false)
                      .searchResult(value);
                });

              },
              controller: searchController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.grey,
                  ),
                  hintText: 'Search for an Artist or a Song'),
            ),
          ),
        ),
        Consumer<AppProvider>(
          builder:
              (BuildContext context, AppProvider appProvider, Widget? child) =>
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: results.length,
                  itemBuilder: (context, index) => results[index],
                ),
              ),
        )
      ],
    );
  }
}
