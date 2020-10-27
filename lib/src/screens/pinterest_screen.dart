import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:headers/src/widgets/pinterest_menu.dart';

class PinterestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation()
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    final display = Provider.of<_MenuModel>(context).display;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (width > 500) {
      width = width - 300;
    }

    return Positioned(
      bottom: 30,
      child: Container(
        width: width,
        child: Row(
          children: <Widget>[
            Spacer(),
            PinterestMenu(
              isDisplayed: display,
              backgroundColor: appTheme.scaffoldBackgroundColor,
              activeColor: appTheme.accentColor,
              items: [
                PinterestButton(icon: Icons.pie_chart, onPressed: () {print('icon pie_chart'); }),
                PinterestButton(icon: Icons.search, onPressed: () {print('icon search'); }),
                PinterestButton(icon: Icons.notifications, onPressed: () {print('icon notifications'); }),
                PinterestButton(icon: Icons.supervised_user_circle, onPressed: () {print('icon supervised_user_circle'); })
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  final List<int> items = List.generate(200, (i) => i);
  ScrollController scrollCtlr = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollCtlr.addListener(() { 
      if (scrollCtlr.position.userScrollDirection == ScrollDirection.reverse && 
          scrollCtlr.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).display = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).display = true;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollCtlr.dispose();
  }

  @override
  Widget build(BuildContext context) {

    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }

    return StaggeredGridView.countBuilder(
      controller: scrollCtlr,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) => StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      )
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _display = true;

  bool get display => this._display;

  set display(bool value) {
    this._display = value;
    notifyListeners();
  }
}