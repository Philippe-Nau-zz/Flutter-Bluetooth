import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth/presentation/home/widgets/bluetooth_box_state.dart';
import 'package:flutter_bluetooth/utils/colors.dart';

class MyAppBar extends StatelessWidget {
  final String? title;
  final Color? backgroundColor;
  MyAppBar({
    this.backgroundColor,
    this.title,
  });

  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
      expandedHeight: 120,
      toolbarHeight: 70,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? '',
                  style: Theme.of(context).textTheme.headline5,
                ),
                StreamBuilder<BluetoothState>(
                  stream: FlutterBlue.instance.state,
                  initialData: BluetoothState.unknown,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      final _state = snapshot.data;
                      return BluetoothBoxState(
                        state: _state,
                      );
                    }
                    return BluetoothBoxState();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
