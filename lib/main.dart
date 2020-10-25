import 'package:flutter/material.dart';
import 'package:headers/src/screens/animate_do_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design App',
      home: AnimateDoScreen()
    );
  }
}