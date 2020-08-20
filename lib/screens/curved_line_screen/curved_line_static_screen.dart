import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'clippers/index.dart';

class CurvedLineStaticScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(0xFFCA8777),
            ),
            ClipPath(
              clipper: WhiteTopClipper(
                  yOffset: MediaQuery.of(context).size.height * 0.38),
              child: Container(
                color: Color(0XFF82B3B9),
              ),
            ),
            ClipPath(
              clipper: GreyTopClipper(
                  yOffset: MediaQuery.of(context).size.height * 0.38),
              child: Container(
                color: Color(0xFF285E7A),
              ),
            ),
            ClipPath(
              clipper: BlueTopClipper(
                  yOffset: MediaQuery.of(context).size.height * 0.38),
              child: Container(
                color: Color(0xFF011627),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
