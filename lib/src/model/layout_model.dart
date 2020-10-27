import 'package:flutter/material.dart';
import 'package:headers/src/screens/slideshow_screen.dart';

class LayoutModel with ChangeNotifier {

  Widget _currentPage = SlideShowScreen();
  
  Widget get currentPage => this._currentPage;

  set currentPage(Widget screen) {
    this._currentPage = screen;
    notifyListeners();
  }
}