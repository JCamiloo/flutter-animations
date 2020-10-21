import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headers/src/widgets/slideshow.dart';

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
    return SlideShow(
      primaryBullet: 15.0,
      secondaryBullet: 10.0,
      primaryColor: Colors.pink,
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