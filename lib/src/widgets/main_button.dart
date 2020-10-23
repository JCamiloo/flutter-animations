import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainButton extends StatelessWidget {

  final IconData icon;
  @required final String text;
  final Color primaryColor;
  final Color secondaryColor;
  @required final Function onPress;

  const MainButton({
    this.icon = FontAwesomeIcons.circle, 
    this.text, 
    this.primaryColor = Colors.grey, 
    this.secondaryColor = Colors.blueGrey, 
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: <Widget>[
          _MainButtonBackground(this.icon, this.primaryColor, this.secondaryColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 140, width: 40),
              FaIcon(
                this.icon,
                color: Colors.white,
                size: 40
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  this.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  )
                )
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white
              ),
              SizedBox(width: 40)
            ],
          )
        ]
      ),
    );
  }
}

class _MainButtonBackground extends StatelessWidget {

  final IconData icon;
  final Color primaryColor;
  final Color secondaryColor;

  _MainButtonBackground(
    this.icon,
    this.primaryColor, 
    this.secondaryColor
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                this.icon,
                size: 150,
                color: Colors.white.withOpacity(0.2)
              ),
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4,6),
            blurRadius: 10
          )
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            this.primaryColor,
            this.secondaryColor
          ]
        )
      ),
    );
  }
}