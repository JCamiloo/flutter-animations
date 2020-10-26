import 'package:flutter/material.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:provider/provider.dart';

class SliverScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BottomButton()
          )
        ],
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);
    final currentTheme = appTheme.currentTheme;

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 80,
      child: RaisedButton(
        onPressed: (){},
        color: (appTheme.darkTheme) ? currentTheme.accentColor : Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: currentTheme.scaffoldBackgroundColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {

  final items = [
    _TaskItem( 'Orange', Color(0xffF08F66) ),
    _TaskItem( 'Family', Color(0xffF2A38A) ),
    _TaskItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _TaskItem( 'Books', Color(0xffFCEBAF) ),
    _TaskItem( 'Orange', Color(0xffF08F66) ),
    _TaskItem( 'Family', Color(0xffF2A38A) ),
    _TaskItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _TaskItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: currentTheme.scaffoldBackgroundColor,
              child: _Title()
            )
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 100)
          ]),
        )
      ],
      
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }
  
  @override
  double get maxExtent => this.maxHeight;
  
  @override
  double get minExtent => this.minHeight;
  
  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return this.maxHeight != oldDelegate.maxHeight || 
           this.minHeight != oldDelegate.minHeight ||
           this.child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10
          ),
          child: Text(
            'New',
            style: TextStyle(
              color: (appTheme.darkTheme) ? Colors.grey : Color(0xff532128),
              fontSize: 50
            )
          ),
        ),
        Stack(
          children: <Widget>[
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xffF7CDD5),
              ),
            ),
            Container(
              child: Text(
                'List', 
                style: TextStyle(
                  color: Color(0xffD93A30), 
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class _TaskList extends StatelessWidget {

  final items = [
    _TaskItem( 'Orange', Color(0xffF08F66) ),
    _TaskItem( 'Family', Color(0xffF2A38A) ),
    _TaskItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _TaskItem( 'Books', Color(0xffFCEBAF) ),
    _TaskItem( 'Orange', Color(0xffF08F66) ),
    _TaskItem( 'Family', Color(0xffF2A38A) ),
    _TaskItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _TaskItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index]
    );
  }
}

class _TaskItem extends StatelessWidget {

  final String title;
  final Color color;

  _TaskItem(this.title, this.color);
  
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      child: Text(
        this.title,
        style: TextStyle(
          color: Colors.white, 
          fontWeight: FontWeight.bold,
          fontSize: 20
        )
      ),
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : this.color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}