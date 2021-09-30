import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth/presentation/home/widgets/device_card.dart';
import 'package:flutter_bluetooth/presentation/home/widgets/device_loader.dart';

class MyDevices extends StatelessWidget {
  const MyDevices();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: StreamBuilder<List<BluetoothDevice>>(
        stream: Stream.periodic(Duration(seconds: 2)).asyncMap(
          (_) => FlutterBlue.instance.connectedDevices,
        ),
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Meus sensores',
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  if (snapshot.connectionState == ConnectionState.waiting)
                    const DeviceLoader(),
                ],
              ),
              Divider(),
              if (snapshot.hasData)
                if (snapshot.data?.isEmpty == true)
                  Center(
                    child: Text(
                      'Não existem dispositvos conectados',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  )
                else
                  Column(
                    children: snapshot.data
                            ?.map(
                              (e) => DeviceCard(
                                device: e,
                              ),
                            )
                            .toList() ??
                        [],
                  )
            ],
          );
        },
      ),
    );
  }
}
