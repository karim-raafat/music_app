import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/custom_widgets/playlist_view.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

import '../utils/helper_functions.dart';

class PlayingSongPage extends StatefulWidget {
  Song song;

  PlayingSongPage({super.key, required this.song});

  static final String routeName = 'play_song';

  @override
  State<PlayingSongPage> createState() => _PlayingSongPageState();
}

class _PlayingSongPageState extends State<PlayingSongPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = const Duration();
  Duration position = const Duration();

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    audioPlayer.setAsset(widget.song.songPath);
    audioPlayer.positionStream.listen((p) {
      setState(() {
        position = p;
      });
    });
    audioPlayer.durationStream.listen((d) {
      setState(() {
        duration = d!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.purple[100],
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
          onPressed: () {
            audioPlayer.stop();
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(widget.song.imagePath),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.song.songName,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.song.artistName,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: handleSeek,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(position),
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  formatTime(duration - position),
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          CircleAvatar(
            radius: 35,
            child: IconButton(
              icon: Icon(audioPlayer.playing ? Icons.pause : Icons.play_arrow),
              iconSize: 50,
              onPressed: () {
                setState(() {
                  playPauseSong();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.song.isFavorite) {
                        appProvider.removeFromFavorites(widget.song);
                      } else {
                        appProvider.addToFavorites(widget.song);
                      }
                    });
                  },
                  iconSize: 40,
                  icon: Icon(
                    !widget.song.isFavorite
                        ? Icons.favorite_border
                        : Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.grey[900],
                      builder: (context) => SafeArea(
                              child: StatefulBuilder(
                            builder: (BuildContext context,
                                    void Function(void Function()) setState) =>
                                Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Choose a Playlist',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: appProvider.playlists.length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                              onTap: () {
                                                if (appProvider
                                                    .playlists[index].songs
                                                    .contains(
                                                        appProvider.song)) {
                                                  showMsg(context,
                                                      'Song is already in the playlist');
                                                } else {
                                                  appProvider.addSongToPlaylist(
                                                      appProvider
                                                          .playlists[index],
                                                      appProvider.song);
                                                }

                                                Navigator.pop(context);
                                              },
                                              child: PlaylistView(
                                                  playlist: appProvider
                                                      .playlists[index]))),
                                ],
                              ),
                            ),
                          )));
                },
                iconSize: 45,
                icon: const Icon(
                  Icons.playlist_add,
                  color: Colors.purple,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void playPauseSong() async {
    if (audioPlayer.playing) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play();
    }
  }

  void handleSeek(double value) {
    audioPlayer.seek(Duration(seconds: value.toInt()));
  }
}
