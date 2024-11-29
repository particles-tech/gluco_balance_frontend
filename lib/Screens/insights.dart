import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class InSightScreen extends StatefulWidget {
  const InSightScreen({super.key});

  @override
  State<InSightScreen> createState() => _InSightsState();
}

class _InSightsState extends State<InSightScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        color: Colors.pink,
        child: Center(child: Text('hi monikeeee')));
  }
}
