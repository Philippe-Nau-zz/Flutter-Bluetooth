import 'package:flutter/material.dart';
import 'package:flutter_bluetooth/utils/colors.dart';

class ConnectedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? textColor;
  final String? text;
  const ConnectedButton({
    this.onPressed,
    this.text,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text ?? '',
          style: TextStyle(
            color: textColor,
          ),
        ),
        Icon(
          Icons.arrow_right_rounded,
          color: AppColors.grey?.withOpacity(0.5),
        ),
      ],
    );
  }
}
