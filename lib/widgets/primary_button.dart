import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final Icon? icon;
  final String title;
  final ButtonType type;

  PrimaryButton({
    this.onPressed,
    this.icon,
    required this.title,
    this.type = ButtonType.elevated,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    );
  }
}

enum ButtonType { elevated, outline }
