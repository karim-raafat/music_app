import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/explore_artist_view.dart';
import 'package:music_app/custom_widgets/explore_song_view.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Just For You',style: TextStyle(color: Colors.white, fontSize: 20),),
        ),

        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: appProvider.allSongs.length,
            itemBuilder: (BuildContext context, int index) => ExploreSongView(song: appProvider.allSongs[index],),

          ),
        ),

        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Artists You May Like',style: TextStyle(color: Colors.white, fontSize: 20),),
        ),


        SizedBox(
            height: 170,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: appProvider.allArtists.length,
              itemBuilder: (BuildContext context, int index) => ArtistAvatarView(artist: appProvider.allArtists[index],),

            ),
          ),


        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Discover More',style: TextStyle(color: Colors.white, fontSize: 20),),
        ),

        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: appProvider.allSongs.length,
            itemBuilder: (BuildContext context, int index) => ExploreSongView(song: appProvider.allSongs[index],),

          ),
        ),

        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Based On Your Recent Activity',style: TextStyle(color: Colors.white, fontSize: 20),),
        ),

        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: appProvider.allSongs.length,
            itemBuilder: (BuildContext context, int index) => ExploreSongView(song: appProvider.allSongs[index],),

          ),
        ),
      ],
    );
  }
}
