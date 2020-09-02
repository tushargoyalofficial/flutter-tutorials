import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'clippers/index.dart';

class CurvedLineAnimatedScreen extends StatefulWidget {
  final double screenHeight;

  const CurvedLineAnimatedScreen({
    @required this.screenHeight,
  }) : assert(screenHeight != null);

  @override
  _CurvedLineAnimatedScreenState createState() =>
      _CurvedLineAnimatedScreenState();
}

class _CurvedLineAnimatedScreenState extends State<CurvedLineAnimatedScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _whiteTopClipperAnimation;
  Animation<double> _blueTopClipperAnimation;
  Animation<double> _greyTopClipperAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    var clipperOffsetTween = Tween<double>(
      begin: widget.screenHeight,
      end: 0.0,
    );

    _blueTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.3,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _greyTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.45,
          0.75,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _whiteTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.6,
          0.8,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF011627),
        elevation: 0,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(0xFFCA8777),
            ),
            AnimatedBuilder(
              animation: _whiteTopClipperAnimation,
              child: Container(color: Color(0XFF82B3B9)),
              builder: (_, Widget child) {
                return ClipPath(
                  clipper: WhiteTopClipper(
                    yOffset: _whiteTopClipperAnimation.value,
                  ),
                  child: child,
                );
              },
            ),
            AnimatedBuilder(
              animation: _greyTopClipperAnimation,
              child: Container(color: Color(0xFF285E7A)),
              builder: (_, Widget child) {
                return ClipPath(
                  clipper: GreyTopClipper(
                    yOffset: _greyTopClipperAnimation.value,
                  ),
                  child: child,
                );
              },
            ),
            AnimatedBuilder(
              animation: _blueTopClipperAnimation,
              child: Container(color: Color(0xFF011627)),
              builder: (_, Widget child) {
                return ClipPath(
                  clipper: BlueTopClipper(
                    yOffset: _blueTopClipperAnimation.value,
                  ),
                  child: child,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
