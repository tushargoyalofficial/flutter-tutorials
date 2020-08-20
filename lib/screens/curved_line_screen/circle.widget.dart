import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final double xAxis;
  final double yAxis;
  final Color color;
  final double circleSize;
  const CircleWidget(
      {Key key,
      @required this.xAxis,
      @required this.yAxis,
      @required this.color,
      @required this.circleSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(this.xAxis, this.yAxis),
      child: Container(
        width: this.circleSize,
        height: this.circleSize,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(this.circleSize / 2),
            color: color),
      ),
    );
  }
}
