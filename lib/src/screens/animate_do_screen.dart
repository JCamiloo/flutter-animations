import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/screens/navigation_screen.dart';
import 'package:headers/src/screens/twitter_screen.dart';

class AnimateDoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          duration: Duration(milliseconds: 500),
          child: Text('Animate do')
        ),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TwitterScreen()));
            },
          ),
          SlideInLeft(
            from: 100,
            child: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => AnimateDoScreen()));
              },
            ),
          )
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NavigationScreen()));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(Icons.new_releases, color: Colors.blue, size: 40)
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text(
                'Title', 
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200
                )
              )
            ),
            FadeInDown(
              delay: Duration(milliseconds: 600),
              child: Text(
                'Short text',
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.w200
                )
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                width: 100,
                height: 2,
                color: Colors.blue,
              ),
            )
          ]
        )
      )
    );
  }
}