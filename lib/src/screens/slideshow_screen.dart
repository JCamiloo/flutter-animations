import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headers/src/widgets/slideshow.dart';
import 'package:headers/src/theme/theme.dart';

class SlideShowScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    bool isLarge;
    final children = [
      Expanded(child: CustomSlideshow()),
      Expanded(child: CustomSlideshow())
    ];

    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    return Scaffold(
      body: isLarge ? Column(children: children) : Row(children: children),
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