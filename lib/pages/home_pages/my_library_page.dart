import 'package:flutter/material.dart';
import 'package:music_app/pages/home_pages/library_pages/my_playlists.dart';
import 'package:music_app/pages/home_pages/library_pages/my_songs_page.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class MyLibraryPage extends StatefulWidget {
  const MyLibraryPage({super.key});

  @override
  State<MyLibraryPage> createState() => _MyLibraryPageState();
}

class _MyLibraryPageState extends State<MyLibraryPage> {
  int selectedIndex = 0;
  bool songPressed = true;
  bool playlistsPressed = false;
  TextEditingController playlistNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      songPressed = true;
                      playlistsPressed = false;
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor:
                        songPressed ? Colors.deepPurple : Colors.grey,
                  ),
                  child: const Text(
                    'My Favorite Songs',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      playlistsPressed = true;
                      songPressed = false;
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor:
                          playlistsPressed ? Colors.deepPurple : Colors.grey),
                  child: const Text(
                    'My Playlists',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (playlistsPressed)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text(
                              'Please enter the playlist name',
                              style: TextStyle(fontSize: 18),
                            ),
                            content: TextField(
                              controller: playlistNameController,
                              onChanged: (value) {
                                playlistNameController.text = value;
                              },
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  playlistNameController.clear();
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  appProvider.createNewPlayList(playlistNameController.text);
                                  playlistNameController.clear();
                                  Navigator.pop(context);
                                },
                                child: const Text('Submit'),
                              ),

                            ],
                          ));
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.create_new_folder_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Create new Playlist',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        (songPressed) ? const MySongsPage() : const MyPlaylistsPage(),
      ],
    );
  }
}
