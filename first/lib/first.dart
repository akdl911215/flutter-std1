import 'package:css_colors/css_colors.dart';
import 'package:flutter/material.dart';
import 'dart:ui' show lerpDouble;
import 'package:flame/flame.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      // home: DemoPage()
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      )
    );
  }
}

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Container(color: CSSColors.aqua));
  }

}

int calculate() {
  return 6 * 7;
}
