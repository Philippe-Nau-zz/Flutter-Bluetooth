import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth/presentation/device/widgets/disconnect_button.dart';
import 'package:flutter_bluetooth/presentation/home/widgets/device_loader.dart';
import 'package:flutter_bluetooth/widgets/app_bar.dart';
import 'package:flutter_bluetooth/widgets/main_container.dart';

class DeviceView extends StatelessWidget {
  final BluetoothDevice device;
  const DeviceView({
    required this.device,
  });
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothDeviceState>(
        stream: device.state,
        initialData: BluetoothDeviceState.connected,
        builder: (context, snapshot) {
          if (snapshot.data == BluetoothDeviceState.disconnected) {
            Navigator.of(context).pop();
          }
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: CustomScrollView(
              slivers: [
                MyAppBar(
                  title: device.name,
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: MainContainer(
                    pdBottom: 20,
                    child: Column(
                      children: [
                      
                        DisconnectButton(
                          onTap: () async {
                            await device.disconnect();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
