import 'package:flutter/material.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:headers/src/widgets/headers.dart';
import 'package:provider/provider.dart';

class HeadersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final accentColor = Provider.of<ThemeChanger>(context).currentTheme.accentColor;

    return Scaffold(
      body: WavesHeader(color: accentColor),
    );
  }
}