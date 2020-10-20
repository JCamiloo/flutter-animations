import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final percentage;
  final Color color;
  final Color accentColor;

  RadialProgress({
    @required this.percentage,
    this.color = Colors.blue,
    this.accentColor = Colors.grey
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  
  AnimationController controller;
  double previousPercentage;

  @override
  void initState() {
    super.initState();
    previousPercentage = widget.percentage;
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final animate = widget.percentage - previousPercentage;
    previousPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _RadialProgress(
              ((widget.percentage - animate) + (animate * controller.value)),
              widget.color,
              widget.accentColor
            ),
          ),
        );
      }
    );
  }
}

class _RadialProgress extends CustomPainter {

  final percentage;
  final Color color;
  final Color accentColor;

  _RadialProgress(this.percentage, this.color, this.accentColor);

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..strokeWidth = 4
      ..color = accentColor
      ..style = PaintingStyle.stroke;
    
    Offset center = Offset(size.width * 0.5, size.height / 2);
    double radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    final arcPaint = Paint()
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..color = color
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}