import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/song_view.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class MySongsPage extends StatefulWidget {
  const MySongsPage({super.key});

  @override
  State<MySongsPage> createState() => _MySongsPageState();
}

class _MySongsPageState extends State<MySongsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget? child) =>
          Expanded(
              child: ListView.builder(
        itemCount: appProvider.favSongs.length,
        itemBuilder: (context, index) => SongView(
          song: appProvider.favSongs[index],
        ),
      )),
    );
  }
}
