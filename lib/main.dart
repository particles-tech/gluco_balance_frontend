import 'package:flutter/material.dart';
import 'package:gluco_balance/Screens/bluetooth.dart';

import 'package:gluco_balance/Screens/homepage.dart';

void main() {
  runApp(const GlucoBalance());
}

class GlucoBalance extends StatefulWidget {
  const GlucoBalance({super.key});

  @override
  State<GlucoBalance> createState() => _GlucoBalanceState();
}

class _GlucoBalanceState extends State<GlucoBalance> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, Widget Function(BuildContext)>{
          '/': (BuildContext context) => HomePage(),
          '/bluetooth': (BuildContext context) => Bluetooth_Screen(),
        });
  }
}
