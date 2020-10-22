import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {

  final Function onPressed;
  final IconData icon;

  PinterestButton({
    @required this.onPressed, 
    @required this.icon
  });
}

class PinterestMenu extends StatelessWidget {

  final bool isDisplayed;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu({
    this.isDisplayed = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    @required this.items
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (isDisplayed) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor = this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;

            return PinterestMenuBackground(
              child: _MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class PinterestMenuBackground extends StatelessWidget {
  
  final Widget child;

  PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {

    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _MenuItem(i, menuItems[i])),
    );
  }
}

class _MenuItem extends StatelessWidget {

  final int index;
  final PinterestButton item;

  const _MenuItem(this.index, this.item);

  @override
  Widget build(BuildContext context) {

    final menuModel = Provider.of<_MenuModel>(context);
    double size;
    Color color;

    if (menuModel.selectedItem == index) {
      size = 35;
      color = menuModel.activeColor;
    } else {
      size = 25;
      color = menuModel.inactiveColor;
    }

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).selectedItem = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: size,
          color: color
        ),
      ),
    );
  }
}


class _MenuModel with ChangeNotifier {

  int _selectedItem = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  int get selectedItem => this._selectedItem;

  set selectedItem(int index) {
    this._selectedItem = index;
    notifyListeners();
  }

  Color get backgroundColor => this._backgroundColor;

  set backgroundColor(Color color) {
    this._backgroundColor = color;
  }

  Color get activeColor => this._activeColor;

  set activeColor(Color color) {
    this._activeColor = color;
  }

  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color color) {
    this._inactiveColor = color;
  }
}