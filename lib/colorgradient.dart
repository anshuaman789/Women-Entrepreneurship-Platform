import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purple Gradient Container',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: GradientContainer(),
    );
  }
}

class GradientContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Color> purpleGradient = [

      Colors.purple[700]!,
      Colors.purple[700]!,
      Colors.purple[700]!,
      Colors.purple[600]!,
      Colors.purple[500]!,
      Colors.purple[400]!,
      Colors.purple[300]!,
      Colors.purple[300]!,
      Colors.purple[300]!,

    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Purple Gradient Container'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: purpleGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Text(
            'Hello, Purple Gradient Container!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
