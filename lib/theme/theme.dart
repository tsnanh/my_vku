import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.red,
  primaryColor: Colors.red.shade700,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    actionsIconTheme: IconThemeData(size: 24, color: Colors.red.shade700),
    centerTitle: true,
    iconTheme: IconThemeData(size: 24, color: Colors.red.shade700),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.red.shade700,
  ),
);
