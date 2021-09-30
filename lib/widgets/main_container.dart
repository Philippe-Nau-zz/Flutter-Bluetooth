import 'package:flutter/material.dart';
import 'package:flutter_bluetooth/utils/colors.dart';

class MainContainer extends StatelessWidget {
  final Widget? child;
  final double pdBottom;
  const MainContainer({
    this.child,
    this.pdBottom = 70,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        right: 20,
        bottom: pdBottom,
        left: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
