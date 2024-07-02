

import 'package:music_app/models/artist.dart';

class Song {
  String songName;
  String artistName;
  String songPath;
  String imagePath;
  bool isFavorite;

  Song(
      {required this.songName,
      required this.artistName,
      required this.songPath,
      required this.imagePath,
      required this.isFavorite});
}
