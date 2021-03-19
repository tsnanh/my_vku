import 'package:flutter/material.dart';
import 'package:myvku/screens/news/pages/absence/page_absence_screen.dart';
import 'package:myvku/screens/news/pages/makeup/page_makeup_screen.dart';
import 'package:myvku/screens/news/pages/news/page_news_screen.dart';
import 'package:myvku/widgets/vku_top_app_bar.dart';

final List<Widget> _tabs = [
  PageNewsScreen(),
  PageAbsenceScreen(),
  PageMakeupScreen()
];

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: _tabs.length,
      child: Scaffold(
        appBar: VKUTopAppBar(
          bottom: TabBar(
            physics: BouncingScrollPhysics(),
            isScrollable: true,
            tabs: [
              Tab(
                text: "NEWS",
              ),
              Tab(
                text: "ABSENCES",
              ),
              Tab(
                text: "MAKEUP CLASSES",
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: _tabs,
        ),
      ),
    );
  }
}
