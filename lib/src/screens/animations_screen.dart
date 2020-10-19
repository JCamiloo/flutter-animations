import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: AnimatedSquare(),
        ),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {

  @override
  _AnimatedSquareState createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> with SingleTickerProviderStateMixin {

  AnimationController animationCtler;
  Animation<double> rotation;
  Animation<double> opacity;
  Animation<double> opacityOut;
  Animation<double> moveToRight;
  Animation<double> scalate;

  @override
  void initState() {
    super.initState();
    animationCtler = AnimationController(
      vsync: this, duration: Duration(milliseconds: 4000)
    );

    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: animationCtler, curve: Curves.easeOut)
    );

    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: animationCtler, curve: Interval(0, 0.25, curve: Curves.easeOut))
    );

    moveToRight = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: animationCtler, curve: Curves.easeOut)
    );

    scalate = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: animationCtler, curve: Curves.easeOut)
    );

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationCtler, curve: Interval(0.75, 1.0, curve: Curves.easeOut))
    );

    animationCtler.addListener(() {
      if (animationCtler.status == AnimationStatus.completed) {
        // animationCtler.reverse();
        animationCtler.reset();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationCtler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationCtler.forward();
    return AnimatedBuilder(
      animation: animationCtler,
      child: _Rectangle(),
      builder: (BuildContext context, Widget rectangle) {
        return Transform.translate(
          offset: Offset(moveToRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value - opacityOut.value,
              child: Transform.scale(
                scale: scalate.value,
                child: rectangle,
              ),
            )
          ),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}