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
          0.2,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _greyTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.35,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _whiteTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.5,
          0.7,
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
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _whiteTopClipperAnimation,
              child: Container(
                color: Colors.blueGrey,
              ),
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
              child: Container(
                color: Colors.blue,
              ),
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
              child: Container(
                color: Colors.redAccent,
              ),
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
