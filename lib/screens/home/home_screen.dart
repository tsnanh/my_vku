import 'package:flutter/material.dart';
import 'package:myvku/screens/news/news_screen.dart';
import 'package:myvku/screens/timetable/timetable_screen.dart';

final List<Widget> widgets = [
  NewsScreen(),
  TimetableScreen()
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: widgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.web_outlined),
            activeIcon: Icon(Icons.web),
            label: 'News',
            tooltip: 'News'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_outlined),
              activeIcon: Icon(Icons.format_list_bulleted),
              label: 'Timetable',
              tooltip: 'Timetable'
          ),
        ],
      ),
    );
  }
}
