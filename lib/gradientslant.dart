import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gradient Container'),
        ),
        body: Center(
          child: GradientContainer(),
        ),
      ),
    );
  }
}

class GradientContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink[700]!,
            Colors.pink[700]!,
            Colors.pink[700]!,
            Colors.pink[600]!,
            Colors.pink[500]!,
            Colors.pink[400]!,
            Colors.pink[300]!,
            Colors.pink[300]!,
            Colors.pink[300]!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: GradientRotation(65 * 3.1415927 / 180), // 45 degrees in radians
        ),
      ),
    );
  }
}
