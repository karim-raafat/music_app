import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/playlist_view.dart';
import 'package:music_app/pages/home_pages/library_pages/playlist_page.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class MyPlaylistsPage extends StatefulWidget {
  const MyPlaylistsPage({super.key});

  @override
  State<MyPlaylistsPage> createState() => _MyPlaylistsPageState();
}

class _MyPlaylistsPageState extends State<MyPlaylistsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget? child) =>
          Expanded(
              child: ListView.builder(
        shrinkWrap: true,
        itemCount: appProvider.playlists.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistPage(playlist: appProvider.playlists[index],)));
            },
            child: PlaylistView(playlist: appProvider.playlists[index])),
      )),
    );
  }
}
