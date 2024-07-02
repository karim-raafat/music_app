import 'package:music_app/models/album.dart';
import 'package:music_app/models/song.dart';

class Artist {
  String artistName;
  List<Song> songs;
  List<Album> albums;
  String imagePath;
  bool isFollowing;

  Artist({required this.artistName,required this.imagePath, required this.isFollowing,required this.songs,required this.albums});

  void addSong(Song song){
    songs.add(song);

  }
}
