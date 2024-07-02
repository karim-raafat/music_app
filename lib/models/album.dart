import 'package:music_app/models/song.dart';

class Album{
  String name;
  String imagePath;
  List<Song> songs;
  bool isFavorite = false;

  Album({required this.name,required this.imagePath, required this.songs});
}