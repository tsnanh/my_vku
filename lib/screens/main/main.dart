import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myvku/di/module.dart';
import 'package:myvku/screens/home/home_screen.dart';
import 'package:myvku/theme/theme.dart';

final GetIt getIt = GetIt.instance;

void main() {
  getIt.initDependencyInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My VKU',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}
