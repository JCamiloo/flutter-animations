import 'package:flutter/material.dart';
import 'package:headers/src/widgets/radial_progress.dart';

class CircularProgressScreen extends StatefulWidget {
  @override
  _CircularProgressScreenState createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen>  with SingleTickerProviderStateMixin {

  double percentage = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: () {
          setState(() {
            percentage += 10;
            if (percentage > 100) {
              percentage = 0;
            }
          });
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(percentage: percentage, color: Colors.blue),
                CustomRadialProgress(percentage: percentage, color: Colors.orange)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(percentage: percentage, color: Colors.red),
                CustomRadialProgress(percentage: percentage, color: Colors.purple)
              ],
            )
          ]
        )
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  
  final double percentage;
  final Color color;
  
  CustomRadialProgress({@required this.percentage, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: RadialProgress(
        percentage: percentage,
        color: color,
        accentColor: Colors.grey,
      ),
    );
  }
}
