import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth/utils/colors.dart';

class BluetoothBoxState extends StatelessWidget {
  final BluetoothState? state;
  const BluetoothBoxState({
    this.state,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> _selectIcon() {
      switch (state) {
        case BluetoothState.on:
          {
            return {
              'text': 'ON',
              'icon': Icons.bluetooth,
            };
          }
        default:
          {
            return {
              'text': 'OFF',
              'icon': Icons.bluetooth_disabled,
            };
          }
      }
    }

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(
            _selectIcon()['icon'],
            size: 20,
            color: AppColors.indigo,
          ),
          Text(
            _selectIcon()['text'],
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}
