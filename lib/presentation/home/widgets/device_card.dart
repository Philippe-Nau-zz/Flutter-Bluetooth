import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth/presentation/device/view/device_view.dart';
import 'package:flutter_bluetooth/utils/colors.dart';
import 'package:flutter_bluetooth/widgets/connect_button.dart';

class DeviceCard extends StatelessWidget {
  final BluetoothDevice device;
  const DeviceCard({
    required this.device,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothDeviceState>(
      stream: device.state,
      initialData: BluetoothDeviceState.disconnected,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            onTap: () async {
              if (snapshot.hasData) {
                if (snapshot.data == BluetoothDeviceState.disconnected) {
                  await device.connect();
                } else if (snapshot.data == BluetoothDeviceState.connected) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DeviceView(
                        device: device,
                      ),
                    ),
                  );
                }
              }
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      device.name,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16,
                            color: AppColors.indigo,
                          ),
                    ),
                    if (snapshot.data == BluetoothDeviceState.connected)
                      ConnectedButton(
                        text: 'Conectado',
                        textColor: AppColors.green,
                        onPressed: () {},
                      )
                  ],
                ),
                const Divider(
                  height: 0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
