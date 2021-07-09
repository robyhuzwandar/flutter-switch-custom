import 'package:flutter/material.dart';
import 'package:flutter_custom_switch_demo/switch_button.dart';

class Payground extends StatelessWidget {
  const Payground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PLAYGROUND')),
      body: Center(child: SwitchButton(onIcon: '✓')),
    );
  }
}
