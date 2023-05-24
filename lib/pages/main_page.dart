import 'package:flutter/material.dart';
import 'package:modu_calorie/pages/favorite_page.dart';
import 'package:modu_calorie/pages/home_page.dart';
import 'package:modu_calorie/pages/user_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);

  final _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.star_rounded),
      label: 'Star',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_rounded),
      label: 'User',
    ),
  ];

  final Widget _fab = FloatingActionButton(
    onPressed: () {},
    backgroundColor: Colors.lightGreen,
    child: const Icon(Icons.camera),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: const [
          HomePage(),
          FavoritePage(),
          UserPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItems,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
      floatingActionButton: _fab,
    );
  }
}
