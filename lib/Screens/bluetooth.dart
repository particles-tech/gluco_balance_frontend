import 'package:gluco_balance/controllers/ble_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class Bluetooth_Screen extends StatefulWidget {
  const Bluetooth_Screen({super.key});

  @override
  State<Bluetooth_Screen> createState() => _Bluetooth_ScreenState();
}

class _Bluetooth_ScreenState extends State<Bluetooth_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BLE SCANNER"),
        ),
        body: GetBuilder<BleController>(
          init: BleController(),
          builder: (BleController controller) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder<List<ScanResult>>(
                      stream: controller.scanResults,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  final data = snapshot.data![index];
                                  return Card(
                                    elevation: 2,
                                    child: ListTile(
                                      title: Text(data.device.name),
                                      subtitle: Text(data.device.id.id),
                                      trailing: Text(data.rssi.toString()),
                                      onTap: () => controller
                                          .connectToDevice(data.device),
                                    ),
                                  );
                                }),
                          );
                        } else {
                          return Center(
                            child: Text("No Device Found"),
                          );
                        }
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        controller.scanDevices();
                        // await controller.disconnectDevice();
                      },
                      child: Text("SCAN")),
                ],
              ),
            );
          },
        ));
  }
}
