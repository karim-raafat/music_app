import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/pages/home_pages/explore_pages/artist_profile_page.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class ArtistAvatarView extends StatelessWidget {
  Artist artist;
  ArtistAvatarView({super.key,required this.artist});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Provider.of<AppProvider>(context,listen: false).chosenArtist(artist);
          context.goNamed(ArtistProfilePage.routeName);
        },
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: ClipOval(
                child: Image.asset(artist.imagePath,fit: BoxFit.cover,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(artist.artistName,style: const TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
