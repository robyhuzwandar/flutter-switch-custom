import 'package:flutter/material.dart';
import 'package:flutter_custom_switch_demo/payground.dart';
import 'package:flutter_custom_switch_demo/switch_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Payground(),
    );
    // return MaterialApp(debugShowCheckedModeBanner: false, home: SwitchButton(),);
  }
}
