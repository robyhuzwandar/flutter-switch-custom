import 'package:flutter/material.dart';
import 'package:flutter_custom_switch_demo/custom_switch.dart';

class SwitchButton extends StatefulWidget {
  final String offIcon;
  final String onIcon;

  const SwitchButton({Key key, this.offIcon, this.onIcon}) : super(key: key);
  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool enableSwitch = false;

  void _toggle() {
    setState(() {
      enableSwitch = !enableSwitch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      behavior: HitTestBehavior.translucent,
      child: CustomSwitch(
        switched: enableSwitch,
        onIcon: widget.onIcon ?? '',
        offIcon: widget.offIcon ?? '',
      ),
    );
  }
}
