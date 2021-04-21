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
        backgroundColor: Colors.white,
        appBar: VKUTopAppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(52),
            child: Container(
              color: Colors.white,
              child: TabBar(
                physics: BouncingScrollPhysics(),
                indicatorColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.red,
                indicatorPadding:
                    EdgeInsets.only(top: 6, bottom: 6, left: 0, right: 0),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.red,
                ),
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
