import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/artist_view.dart';
import 'package:music_app/custom_widgets/song_view.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/models/playlist.dart';
import 'package:music_app/utils/constants.dart';


import '../models/artist.dart';
import '../models/song.dart';

class AppProvider extends ChangeNotifier {



  List<Song> _allSongs = [noaataBieda,ctrl,elMabda2,elSekaShemal,kontFaker,mshBel7zoz,sindbad,telkQadeya];
  List<Artist> _allArtists = [afroto,amrDiab,cairokee,marwanPablo,mohamedMonuir];
  List<Song> _favSongs = [];
  List<Artist> _folArtists = [];
  List<Playlist> _playlists = [];

  List<Playlist> get playlists => _playlists;

  set playlists(List<Playlist> value) {
    _playlists = value;
  }

  late Song song;
  late Artist artist;
  late Album album;

  List<Song> get allSongs => _allSongs;

  List<Artist> get allArtists => _allArtists;

  List<Song> get favSongs => _favSongs;

  List<Artist> get folArtists => _folArtists;


  void createNewPlayList(String name){
    Playlist playlist = Playlist(name: name);
    playlists.add(playlist);
    notifyListeners();
  }

  void addSongToPlaylist(Playlist playlist,Song song){
    playlist.songs.add(song);
    notifyListeners();
  }

  void removeSongFromPlaylist(Playlist playlist,Song song){
    playlist.songs.remove(song);
    notifyListeners();
  }

  void deletePlaylist(Playlist playlist){
    playlists.remove(playlist);
    notifyListeners();
  }


  void chosenSong(Song song) {
    this.song = song;
  }

  void chosenArtist(Artist artist) {
    this.artist = artist;
  }

  void chosenAlbum(Album album){
    this.album = album;
  }

  void addToFavorites(Song song) {
    song.isFavorite = true;
    _favSongs.add(song);
    notifyListeners();
  }

  void followArtist(Artist artist) {
    artist.isFollowing = true;
    _folArtists.add(artist);
    notifyListeners();
  }

  void removeFromFavorites(Song song) {
    song.isFavorite = false;
    _favSongs.remove(song);
    notifyListeners();
  }

  void unfollowArtist(Artist artist) {
    artist.isFollowing = false;
    _folArtists.remove(artist);
    notifyListeners();
  }

  void addAlbumToFavorites(Album album){
    album.isFavorite=true;
    for(int i = 0 ; i<album.songs.length ; i++){
      addToFavorites(album.songs[i]);
    }
  }

  List<Widget> searchResult(String value){
    List<Widget> results = [];
    for(int i = 0; i<allSongs.length ; i++){
      if(allSongs[i].songName.toLowerCase().contains(value.toLowerCase())){
        results.add(SongView(song: allSongs[i]));
      }
    }

    for(int i = 0; i<allArtists.length ; i++){
      if(allArtists[i].artistName.toLowerCase().contains(value.toLowerCase())){
        results.add(ArtistView(artist: allArtists[i]));
      }
    }
    return results;
  }


}
