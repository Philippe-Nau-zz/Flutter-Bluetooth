import 'package:flutter/material.dart';
import 'package:flutter_bluetooth/utils/colors.dart';

class FloatingSearchButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;
  const FloatingSearchButton({this.onPressed, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: color,
      child: Icon(
        icon,
        size: 40,
        color: AppColors.white80,
      ),
    );
  }
}
