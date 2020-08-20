import 'package:flutter/material.dart';
import 'curved_line_animated_screen .dart';

class CurvedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        var screenHeight = MediaQuery.of(context).size.height;

        return CurvedLineAnimatedScreen(
          screenHeight: screenHeight,
        );
      },
    );
  }
}
