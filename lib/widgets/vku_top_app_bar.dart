import 'package:flutter/material.dart';

class VKUTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  VKUTopAppBar({this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        "assets/images/vku_logo.png",
        fit: BoxFit.contain,
        width: 90,
      ),
      leading: IconButton(
        icon: Icon(
          Icons.settings,
        ),
        onPressed: () {
          // TODO navigate to settings
        },
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      bottom == null ? Size.fromHeight(64) : Size.fromHeight(120);
}
