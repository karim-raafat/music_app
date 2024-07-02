import 'package:flutter/material.dart';
import 'package:music_app/models/playlist.dart';
import 'package:music_app/provider/AppProvider.dart';

import 'package:music_app/utils/helper_functions.dart';
import 'package:provider/provider.dart';

class PlaylistView extends StatelessWidget {
  Playlist playlist;
  Color color = getRandomColor();

  PlaylistView({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          height: 35,
          width: 35,
          child: const Icon(Icons.music_note, color: Colors.white,),
        ),
        title: Text(
          playlist.name, style: const TextStyle(color: Colors.white),),
        subtitle: Text('${playlist.songs.length} Songs'),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.grey,),
          onPressed: () {
            showDialog(context: context, builder: (context) =>AlertDialog(
              title: const Text('Are you sure you want to delete this playlist?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red
                  ),
                  onPressed: () {
                    appProvider.deletePlaylist(playlist);
                    Navigator.pop(context);
                  },
                  child: const Text('Delete',style: TextStyle(color: Colors.white),),
                ),
              ],
            )

            );
          },
        ),

      ),
    );
  }
}
