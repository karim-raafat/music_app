import 'package:music_app/models/album.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/models/song.dart';

Song noaataBieda = Song(
    songName: 'Noaata Bieda',
    artistName: 'Cairokee',
    songPath: 'assets/songs/Noaata Beida.mp3',
    imagePath: 'assets/images/Noaata Beida.jpeg',
    isFavorite: false);
Song elSekaShemal = Song(
    songName: 'El Seka Shemal',
    artistName: 'Cairokee',
    songPath: 'assets/songs/EL Seka Shemal.mp3',
    imagePath: 'assets/images/Noaata Beida.jpeg',
    isFavorite: false);
Song kontFaker = Song(
    songName: 'Kont Faker',
    artistName: 'Cairokee',
    songPath: 'assets/songs/Kont Faker.mp3',
    imagePath: 'assets/images/Noaata Beida.jpeg',
    isFavorite: false);
Song telkQadeya = Song(
    songName: 'Telk Qadeya',
    artistName: 'Cairokee',
    songPath: 'assets/songs/Telk Qadeya.mp3',
    imagePath: 'assets/images/Telk Qadeya.jpg',
    isFavorite: false);
Song ctrl = Song(
    songName: 'CTRL',
    artistName: 'Marwan Pablo',
    songPath: 'assets/songs/CTRL.mp3',
    imagePath: 'assets/images/CTRL.jpg',
    isFavorite: false);
Song elMabda2 = Song(
    songName: 'El Mabda2',
    artistName: 'Marwan Pablo',
    songPath: 'assets/songs/EL MABDA2.mp3',
    imagePath: 'assets/images/El Mabda2.jpg',
    isFavorite: false);
Song sindbad = Song(
    songName: 'Sindbad',
    artistName: 'Marwan Pablo',
    songPath: 'assets/songs/Sindbad.mp3',
    imagePath: 'assets/images/Sindbad.jpg',
    isFavorite: false);
Song mshBel7zoz = Song(
    songName: 'Msh Bel 7ozoz',
    artistName: 'Afroto',
    songPath: 'assets/songs/Msh Bel 7ozoz.mp3',
    imagePath: 'assets/images/Msh Bel 7zoz.jpg',
    isFavorite: false);

Album noaataBiedaAlb = Album(
    name: 'Noaata Bieda',
    imagePath: 'assets/images/Noaata Beida.jpeg',
    songs: [
      noaataBieda,
      elSekaShemal,
      kontFaker,
    ]);


Artist cairokee = Artist(
    artistName: 'Cairokee',
    imagePath: 'assets/images/Cairokee.png',
    songs: [
      telkQadeya,
      noaataBieda,
      elSekaShemal,
      kontFaker,
    ],
    albums: [
      noaataBiedaAlb
    ],
    isFollowing: false);
Artist afroto = Artist(
    artistName: 'Afroto',
    imagePath: 'assets/images/Afroto.jpg',
    isFollowing: false,
    songs: [
      mshBel7zoz,
    ],
    albums: []);
Artist amrDiab = Artist(
    artistName: 'Amr Diab',
    imagePath: 'assets/images/Amr Diab.jpeg',
    isFollowing: false,
    songs: [],
    albums: []);
Artist marwanPablo = Artist(
    artistName: 'Marwan Pablo',
    imagePath: 'assets/images/Marwan Pablo.jpg',
    isFollowing: false,
    songs: [
      ctrl,
      elMabda2,
      sindbad,
    ],
    albums: []);
Artist mohamedMonuir = Artist(
    artistName: 'Mohamed Monuir',
    imagePath: 'assets/images/Mohamed Monuir.jpg',
    isFollowing: false,
    songs: [],
    albums: []);