import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/album_view.dart';
import 'package:music_app/custom_widgets/song_view.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class ArtistProfilePage extends StatefulWidget {
  Artist artist;

  ArtistProfilePage({super.key, required this.artist});

  static final String routeName = 'artist_profile';

  @override
  State<ArtistProfilePage> createState() => _ArtistProfilePageState();
}

class _ArtistProfilePageState extends State<ArtistProfilePage> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.artist.imagePath),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: 20,
                left: 10,
                child: Text(
                  widget.artist.artistName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              Positioned(
                top: 20,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              if(widget.artist.isFollowing){
                appProvider.unfollowArtist(widget.artist);
              }
              else{
                appProvider.followArtist(widget.artist);
              }
            },
            style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
            child: Text(
              (widget.artist.isFollowing) ? 'Unfollow' : 'Follow',
              style: const TextStyle(
                color: Colors.white
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Albums',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 180,
            child: (widget.artist.albums.isEmpty)
                ? const Center(
                    child: Text(
                    'The artists has not published any albums yet',
                    style: TextStyle(color: Colors.deepPurple),
                  ))
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.artist.albums.length,
                    itemBuilder: (context, index) => AlbumView(
                          album: widget.artist.albums[index],
                        )),
          ),
          const Text(
            'Songs',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.artist.songs.length,
            itemBuilder: (context, index) =>
                SongView(song: widget.artist.songs[index]),
          )
        ],
      ),
    );
  }
}
