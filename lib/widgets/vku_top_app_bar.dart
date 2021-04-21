import 'package:flutter/material.dart';

class VKUTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;

  VKUTopAppBar({this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          "assets/images/vku_logo.png",
          fit: BoxFit.contain,
          width: 78,
        ),
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
      Size.fromHeight(56 + (bottom?.preferredSize.height ?? 0));
}
