import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/screens/slideshow_screen.dart';
import 'package:headers/src/screens/emergency_screen.dart';
import 'package:headers/src/screens/headers_screen.dart';
import 'package:headers/src/screens/animations_screen.dart';
import 'package:headers/src/screens/animate_do_screen.dart';
import 'package:headers/src/screens/circular_progress_screen.dart';
import 'package:headers/src/screens/pinterest_screen.dart';
import 'package:headers/src/screens/sliver_screen.dart';

final screenRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideShowScreen()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyScreen()),
  _Route(FontAwesomeIcons.heading, 'Headers', HeadersScreen()),
  _Route(FontAwesomeIcons.peopleCarry, 'Animation', AnimationsScreen()),
  _Route(FontAwesomeIcons.rainbow, 'Animate do', AnimateDoScreen()),
  _Route(FontAwesomeIcons.circleNotch, 'Progress Bar', CircularProgressScreen()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestScreen()),
  _Route(FontAwesomeIcons.mobile, 'Sliver', SliverScreen()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget screen;

  _Route(this.icon, this.title, this.screen);
}