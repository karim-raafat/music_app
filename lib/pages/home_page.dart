import 'package:flutter/material.dart';
import 'package:music_app/pages/home_pages/explore_page.dart';
import 'package:music_app/pages/home_pages/my_library_page.dart';
import 'package:music_app/pages/home_pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static final String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sama3ny',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 15.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                size: 25.0,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                )),
          )
        ],
      ),
      backgroundColor: Colors.grey[900],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20.0,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black26,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'My Library',
          ),
        ],
      ),
      body: (selectedIndex == 0)
          ? const ExplorePage()
          : (selectedIndex == 1)
          ? const SearchPage()
          : const MyLibraryPage(),
    );
  }
}
