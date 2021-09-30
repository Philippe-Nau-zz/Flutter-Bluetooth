import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth/presentation/home/widgets/device_card.dart';
import 'package:flutter_bluetooth/presentation/home/widgets/device_loader.dart';

class NewDevices extends StatelessWidget {
  const NewDevices();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Novos sensores',
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: 16,
                    ),
              ),
              StreamBuilder<bool>(
                stream: FlutterBlue.instance.isScanning,
                initialData: false,
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return const DeviceLoader();
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
          Divider(),
          StreamBuilder<List<ScanResult>>(
            stream: FlutterBlue.instance.scanResults,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: snapshot.data?.map(
                        (e) {
                          if (e.device.name.isNotEmpty) {
                            return DeviceCard(
                              device: e.device,
                            );
                          }
                          return SizedBox();
                        },
                      ).toList() ??
                      [],
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
