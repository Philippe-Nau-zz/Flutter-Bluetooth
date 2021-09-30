import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth/presentation/home/widgets/floating_search_button.dart';
import 'package:flutter_bluetooth/presentation/home/widgets/my_devices.dart';
import 'package:flutter_bluetooth/presentation/home/widgets/new_devices.dart';
import 'package:flutter_bluetooth/utils/colors.dart';
import 'package:flutter_bluetooth/widgets/app_bar.dart';
import 'package:flutter_bluetooth/widgets/main_container.dart';

class HomeView extends StatelessWidget {
  const HomeView();

  @override
  Widget build(BuildContext context) {
    final _flutterBlue = FlutterBlue.instance;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: [
          MyAppBar(
            title: 'Flutter Bluetooth',
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: _BodyView(),
          ),
        ],
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: _flutterBlue.isScanning,
        initialData: false,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return FloatingSearchButton(
              onPressed: () => _flutterBlue.stopScan(),
              color: AppColors.red,
              icon: Icons.stop_rounded,
            );
          }
          return FloatingSearchButton(
            onPressed: () => _flutterBlue.startScan(),
            color: AppColors.indigo,
            icon: Icons.manage_search_rounded,
          );
        },
      ),
    );
  }
}

class _BodyView extends StatelessWidget {
  const _BodyView();

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Column(
        children: const [
          MyDevices(),
          SizedBox(
            height: 50,
          ),
          NewDevices(),
        ],
      ),
    );
  }
}
