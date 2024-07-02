import 'package:flutter/material.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/pages/home_pages/explore_pages/album_pages/album_page.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';


class AlbumView extends StatelessWidget {
  Album album;

  AlbumView({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<AppProvider>(context, listen: false).chosenAlbum(album);
              Navigator.push(context, MaterialPageRoute(builder: (context) => AlbumPage(album: album)));
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(album.imagePath), fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    album.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white),
                  ),

                ],
              ),

            ],
          )
        ],
      ),
    );
  }
}
