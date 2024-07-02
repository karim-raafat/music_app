import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/custom_widgets/playlist_view.dart';
import 'package:music_app/pages/playing_song_page.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:music_app/utils/helper_functions.dart';
import 'package:provider/provider.dart';

import '../models/song.dart';

class ExploreSongView extends StatelessWidget {
  Song song;

  ExploreSongView({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<AppProvider>(context, listen: false).chosenSong(song);
              context.goNamed(
                PlayingSongPage.routeName,
              );
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(song.imagePath), fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.songName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    song.artistName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.grey[900],
                        builder: (context) => SafeArea(child: StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          if (song.isFavorite) {
                                            showMsg(context,
                                                'Song is already in favorites');
                                          } else {
                                            Provider.of<AppProvider>(context,
                                                    listen: false)
                                                .addToFavorites(song);
                                            showMsg(context,
                                                'Song saved in favorites');
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.deepPurple),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Add to favorites',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          showModalBottomSheet(
                                              context: context,
                                              backgroundColor: Colors.grey[900],
                                              builder: (context) => SafeArea(
                                                      child: StatefulBuilder(
                                                    builder: (BuildContext
                                                                context,
                                                            void Function(
                                                                    void
                                                                        Function())
                                                                setState) =>
                                                        Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Text(
                                                            'Choose a Playlist',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          ListView.builder(
                                                              shrinkWrap: true,
                                                              itemCount:
                                                                  appProvider
                                                                      .playlists
                                                                      .length,
                                                              itemBuilder: (context,
                                                                      index) =>
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        if (appProvider
                                                                            .playlists[index]
                                                                            .songs
                                                                            .contains(song)) {
                                                                          showMsg(
                                                                              context,
                                                                              'Song is already in the playlist');
                                                                        } else {
                                                                          appProvider.addSongToPlaylist(
                                                                              appProvider.playlists[index],
                                                                              song);
                                                                        }

                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: PlaylistView(
                                                                          playlist:
                                                                              appProvider.playlists[index]))),
                                                        ],
                                                      ),
                                                    ),
                                                  )));
                                        },
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.deepPurple),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                  color: Colors.white),
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
                    Icons.more_vert,
                    color: Colors.deepPurple,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
