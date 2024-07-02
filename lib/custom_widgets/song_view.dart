import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/playlist_view.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/pages/playing_song_page.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:music_app/utils/helper_functions.dart';
import 'package:provider/provider.dart';

class SongView extends StatelessWidget {
  Song song;

  SongView({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Provider.of<AppProvider>(
            context,
            listen: false,
          ).chosenSong(song);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PlayingSongPage(song: song)));
        },
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(song.imagePath), fit: BoxFit.cover),
                ),
              ),
              title: Text(
                song.songName,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.grey[900],
                              builder:
                                  (context) => SafeArea(child: StatefulBuilder(
                                        builder: (BuildContext context,
                                            void Function(void Function())
                                                setState) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    showModalBottomSheet(
                                                        context: context,
                                                        backgroundColor:
                                                            Colors.grey[900],
                                                        builder: (context) =>
                                                            SafeArea(
                                                                child:
                                                                    StatefulBuilder(
                                                              builder: (BuildContext
                                                                          context,
                                                                      void Function(
                                                                              void Function())
                                                                          setState) =>
                                                                  Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    const Text(
                                                                      'Choose a Playlist',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    ListView.builder(
                                                                        shrinkWrap: true,
                                                                        itemCount: appProvider.playlists.length,
                                                                        itemBuilder: (context, index) => GestureDetector(
                                                                            onTap: () {
                                                                              if (appProvider.playlists[index].songs.contains(song)) {
                                                                                showMsg(context, 'Song is already in the playlist');
                                                                              } else {
                                                                                appProvider.addSongToPlaylist(appProvider.playlists[index], song);
                                                                              }

                                                                              Navigator.pop(context);
                                                                            },
                                                                            child: PlaylistView(playlist: appProvider.playlists[index]))),
                                                                  ],
                                                                ),
                                                              ),
                                                            )));
                                                  },
                                                  style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.deepPurple),
                                                  child: const Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.playlist_add,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'Add to Playlist',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      )));
                        },
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Colors.deepPurple,
                        )),
                    IconButton(
                        onPressed: () {
                          if (song.isFavorite) {
                            appProvider.removeFromFavorites(song);
                            showMsg(context, 'Song removed from Favorites');
                          } else {
                            appProvider.addToFavorites(song);
                            showMsg(context, 'Song added to Favorites');
                          }
                        },
                        icon: Icon(
                          (song.isFavorite)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        )),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                thickness: 0.2,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
