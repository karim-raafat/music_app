import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/song_view.dart';
import 'package:music_app/models/playlist.dart';
import 'package:music_app/utils/helper_functions.dart';



class PlaylistPage extends StatefulWidget {
  Playlist playlist;

  PlaylistPage({super.key, required this.playlist});

  static final String routeName = 'album_page';

  @override
  State<PlaylistPage> createState() => _PlaylistPage();
}

class _PlaylistPage extends State<PlaylistPage> {
  Color color = getRandomColor();

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: color,
                    ),
                    height: 55,
                    width: 55,
                    child: const Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          widget.playlist.name,
                          style: const TextStyle(color: Colors.white,fontSize: 20),
                        ),
                        Text(
                          '${widget.playlist.songs.length} Songs',
                          style: const TextStyle(color: Colors.grey,fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.playlist.songs.length,
                itemBuilder: (context, index) =>
                    SongView(song: widget.playlist.songs[index]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
