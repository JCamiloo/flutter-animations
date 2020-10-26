import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:headers/src/screens/launcher_screen.dart';
import 'package:headers/src/theme/theme.dart';
 
void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => ThemeChanger(2),
    child: MyApp(),
  )
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Design App',
      home: LauncherScreen()
    );
  }
}