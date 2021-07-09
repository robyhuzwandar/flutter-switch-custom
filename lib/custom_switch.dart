import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _SwitchBoxProps { paddingLeft, color, text, rotation }

class CustomSwitch extends StatelessWidget {
  final bool switched;

  CustomSwitch({this.switched});

  @override
  Widget build(BuildContext context) {
    var tween = MultiTween<_SwitchBoxProps>()
      ..add(_SwitchBoxProps.paddingLeft, 0.0.tweenTo(30.0), 1.milliseconds)
      ..add(_SwitchBoxProps.color, Color(0xFFC5C5C5).tweenTo(Color(0xFF25333D)),
          1.milliseconds)
      ..add(_SwitchBoxProps.text, ConstantTween(""), 1.milliseconds)
      ..add(_SwitchBoxProps.text, ConstantTween("✓"), 1.milliseconds);

    return CustomAnimation<MultiTweenValues<_SwitchBoxProps>>(
      control: switched
          ? CustomAnimationControl.PLAY
          : CustomAnimationControl.PLAY_REVERSE,
      startPosition: switched ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
      tween: tween,
      curve: Curves.easeInOut,
      builder: _buildSwitchBox,
    );
  }

  Widget _buildSwitchBox(
      context, child, MultiTweenValues<_SwitchBoxProps> value) {
    return Container(
      width: 60,
      height: 40,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
              width: 60, height: 5, color: value.get(_SwitchBoxProps.color)),
          Positioned(
              child: Padding(
                  padding: EdgeInsets.only(
                      left: value.get(_SwitchBoxProps.paddingLeft)),
                  child: Container(
                    decoration:
                        _innerBoxDecoration(value.get(_SwitchBoxProps.color)),
                    width: 30,
                    height: 30,
                    child: Center(
                        child: Text(value.get(_SwitchBoxProps.text),
                            style: labelStyle)),
                  )))
        ],
      ),
    );
  }

  BoxDecoration _innerBoxDecoration(Color color) => BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(50)), color: color);

  BoxDecoration _outerBoxDecoration(Color color) => BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(
          width: 2,
          color: color,
        ),
      );

  static final labelStyle = TextStyle(
      height: 1.3,
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: Colors.white);
}