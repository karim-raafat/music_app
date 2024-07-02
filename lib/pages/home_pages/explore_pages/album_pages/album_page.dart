import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/song_view.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:music_app/utils/helper_functions.dart';
import 'package:provider/provider.dart';

import '../../../../custom_widgets/playlist_view.dart';

class AlbumPage extends StatefulWidget {
  Album album;

  AlbumPage({super.key, required this.album});

  static final String routeName = 'album_page';

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.album.imagePath))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.album.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        for(int i = 0 ; i < widget.album.songs.length ; i++){
                          if(!appProvider.favSongs.contains(widget.album.songs[i])){
                            appProvider.addToFavorites(widget.album.songs[i]);
                          }
                        }


                      });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border,color: Colors.white,),
                        SizedBox(width: 10,),
                        Text('Add all to favorites',style: TextStyle(color: Colors.white,fontSize: 11),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
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
                                                        for(int i = 0 ; i<widget.album.songs.length ; i++){
                                                          if (appProvider.playlists[index].songs.contains(widget.album.songs[i])) {
                                                            showMsg(context, 'Song is already in the playlist');
                                                          } else {
                                                            appProvider.addSongToPlaylist(appProvider.playlists[index], widget.album.songs[i]);
                                                          }
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
                        backgroundColor: Colors.deepPurple
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.playlist_add,color: Colors.white,),
                        SizedBox(width: 10,),
                        Text('Add all to playlist',style: TextStyle(color: Colors.white,fontSize: 11),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.album.songs.length,
              itemBuilder: (context, index) =>
                  SongView(song: widget.album.songs[index]),
            )
          ],
        ),
      ),
    );
  }
}
