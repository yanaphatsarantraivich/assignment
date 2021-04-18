import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'add_screen.dart';
import 'mylist_screen.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  void _onPageChanged(int index) {}

  List<Widget> _screens = [HomeSceen(), AddScreen(), MyListScreen()];

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
    setState(() {
      _currentIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            title: Text("Add"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list_outlined),
              title: Text("My List"),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              title: Text("Logout"),
              backgroundColor: Colors.black)
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
