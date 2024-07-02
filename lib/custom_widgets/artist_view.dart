import 'package:flutter/material.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/pages/home_pages/explore_pages/artist_profile_page.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:music_app/utils/helper_functions.dart';
import 'package:provider/provider.dart';

class ArtistView extends StatelessWidget {
  Artist artist;

  ArtistView({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Provider.of<AppProvider>(context,listen: false,).chosenArtist(artist);
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ArtistProfilePage(artist: artist)));
        },
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 50,

                child: ClipOval(

                  child: Image.asset(artist.imagePath,fit: BoxFit.cover,),
                ),
              ),
              title: Text(
                artist.artistName,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: SizedBox(
                width: 60,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          if(artist.isFollowing){
                            appProvider.unfollowArtist(artist);
                            showMsg(context, 'Unfollowed ${artist.artistName}');
                          }
                          else{
                            appProvider.followArtist(artist);
                            showMsg(context, 'Following ${artist.artistName}');
                          }
                        },
                        icon: Icon(
                          (artist.isFollowing)?
                          Icons.notifications:
                              Icons.notifications_none_outlined,
                          color: Colors.deepPurple,
                        )),

                  ],
                ),
              ),

            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(thickness: 0.2,color: Colors.grey,),
            )
          ],
        ),
      ),
    );
  }
}
