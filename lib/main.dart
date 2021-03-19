import 'package:flutter/material.dart';
import 'package:myvku/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My VKU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            actionsIconTheme: IconThemeData(size: 24, color: Colors.red),
            centerTitle: true,
            iconTheme: IconThemeData(size: 24, color: Colors.red),
          ),
          tabBarTheme: TabBarTheme(
            labelColor: Colors.red,
          )),
      home: HomeScreen(),
    );
  }
}
