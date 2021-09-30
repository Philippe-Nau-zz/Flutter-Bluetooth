import 'package:flutter/material.dart';
import 'package:flutter_bluetooth/utils/colors.dart';

class DeviceLoader extends StatelessWidget {
  const DeviceLoader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 35,
      height: 35,
      child: CircularProgressIndicator(
        strokeWidth: 1,
        color: AppColors.grey,
      ),
    );
  }
}
