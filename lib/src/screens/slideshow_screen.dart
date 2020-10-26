import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:headers/src/widgets/slideshow.dart';
import 'package:provider/provider.dart';

class SlideShowScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: CustomSlideshow()),
          Expanded(child: CustomSlideshow())
        ],
      ),
    );
  }
}

class CustomSlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return SlideShow(
      primaryBullet: 15.0,
      secondaryBullet: 10.0,
      primaryColor: appTheme.darkTheme ? accentColor : Color(0xffFF5A7E),
      dotsUp: false,
      slides: [
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
        SvgPicture.asset('assets/svg/slide-5.svg'),
      ],
    );
  }
}