import 'package:flutter/material.dart';

import '../../recipe_list_page.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int _currentIndex = 0;

  List<Widget> pages = [
    const RecipeListPage(),
    const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Center(child: Text('Second Page')),
    ),
    const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Center(child: Text('Third Page')),
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.orange[100],
      child: const Center(child: Text('Forth Page')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[_currentIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() {
          _currentIndex = index;
        }),
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'ホーム',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.post_add),
            icon: Icon(Icons.post_add),
            label: '投稿',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person),
            label: 'プロファイル',
          ),
        ],
      ),
    );
  }
}
