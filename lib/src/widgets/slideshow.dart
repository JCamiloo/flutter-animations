import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {

  final List<Widget> slides;
  final bool dotsUp;
  final Color primaryColor;
  final Color accentColor;
  final double primaryBullet;
  final double secondaryBullet;

  SlideShow({
    @required this.slides,
    this.dotsUp = false,
    this.primaryColor = Colors.blue,
    this.accentColor = Colors.grey,
    this.primaryBullet = 12.0,
    this.secondaryBullet = 12.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider(
        create: (_) => _SlideshowModel(),
        child: SafeArea(
          child: Center(
            child: Builder(
              builder: (BuildContext context) {
                Provider.of<_SlideshowModel>(context).primaryColor = this.primaryColor;                
                Provider.of<_SlideshowModel>(context).accentColor = this.accentColor;              
                Provider.of<_SlideshowModel>(context).primaryBullet = this.primaryBullet;              
                Provider.of<_SlideshowModel>(context).secondaryBullet = this.secondaryBullet;              

                return Column(
                  children: [
                    if (this.dotsUp) _Dots(this.slides.length),
                    Expanded(
                      child: _Slides(this.slides)
                    ),
                    if (!this.dotsUp) _Dots(this.slides.length),
                  ],
                );
              }
            )
          ),
        ),
      ),
    );
  }
}


class _Dots extends StatelessWidget {

  final int dotsAmount;

  _Dots(this.dotsAmount);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          dotsAmount, (i) => _Dot(i),
        )
      )
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {

    final slideshowModel = Provider.of<_SlideshowModel>(context);
    double size;
    Color color;

    if (slideshowModel.currentPage >= index - 0.5 && 
        slideshowModel.currentPage < index + 0.5) {
      size = slideshowModel.primaryBullet;
      color = slideshowModel.primaryColor;
    } else {
      size = slideshowModel.secondaryBullet;
      color = slideshowModel.accentColor;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewCtlr = PageController();

  @override
  void initState() {
    super.initState();
    pageViewCtlr.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewCtlr.page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageViewCtlr.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewCtlr,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide
    );
  }
}

class _SlideshowModel with ChangeNotifier {

  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _accentColor = Colors.grey;
  double _primaryBullet = 12.0;
  double _secondaryBullet = 12.0;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color primaryColor) {
    this._primaryColor = primaryColor;
  }

  Color get accentColor => this._accentColor;

  set accentColor(Color accentColor) {
    this._accentColor = accentColor;
  }
  
  double get primaryBullet => this._primaryBullet;

  set primaryBullet(double primaryBullet) {
    this._primaryBullet = primaryBullet;
  }

  double get secondaryBullet => this._secondaryBullet;

  set secondaryBullet(double secondaryBullet) {
    this._secondaryBullet = secondaryBullet;
  }
}