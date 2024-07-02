import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/pages/home_pages/explore_pages/album_pages/album_page.dart';
import 'package:music_app/pages/home_pages/explore_pages/artist_profile_page.dart';
import 'package:music_app/pages/home_page.dart';
import 'package:music_app/pages/playing_song_page.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }

  final _router = GoRouter(debugLogDiagnostics: true, routes: [
    GoRoute(
        path: HomePage.routeName,
        name: HomePage.routeName,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: PlayingSongPage.routeName,
            name: PlayingSongPage.routeName,
            builder: (context, state) => PlayingSongPage(
              song: Provider.of<AppProvider>(context).song,
            ),
          ),
          GoRoute(
              path: ArtistProfilePage.routeName,
              name: ArtistProfilePage.routeName,
              builder: (context, state) => ArtistProfilePage(
                  artist:
                      Provider.of<AppProvider>(context, listen: false).artist),
              routes: [
                GoRoute(
                  path: AlbumPage.routeName,
                  name: AlbumPage.routeName,
                  builder: (context,state) => AlbumPage(album: Provider.of<AppProvider>(context,listen: false).album)
                ),
              ]),
        ]),
  ]);
}
