import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/features/feed/presentation/pages/feed_screen.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            activeIcon: Icon(IconlyBold.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.folder),
            activeIcon: Icon(IconlyBold.folder),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            activeIcon: Icon(IconlyBold.profile),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        sizing: StackFit.expand,
        children: const [
          FeedScreen(),
          Scaffold(
            body: Center(
              child: Text("Library Page"),
            ),
          ),
          Scaffold(
            body: Center(
              child: Text("Profile Page"),
            ),
          ),
        ],
      ),
    );
  }
}
