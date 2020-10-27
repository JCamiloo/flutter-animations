import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/widgets/headers.dart';
import 'package:headers/src/widgets/main_button.dart';

class EmergencyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    bool isLarge;

    if (MediaQuery.of(context).size.height > 550) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final items = <ItemBoton>[
      ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

    List<Widget> itemMap = items.map(
      (item) => FadeInLeft(
        child: MainButton(
          icon: item.icon,
          primaryColor: item.color1,
          secondaryColor: item.color2,
          text: item.text,
          onPress: () { print('Hi'); },
        ),
      )
    ).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: isLarge ? 220 : 10),
            child: SafeArea(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  if (isLarge)
                    SizedBox(height: 80),
                  ...itemMap,
                ],
              ),
            ),
          ),
          if (isLarge)
            Header()
        ],
      )
    );
  }
}

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'You have requested',
          subtitle: 'Medical assistance',
          primaryColor: Color(0xff536CF6),
          accentColor: Color(0xff66A9F2),
        ),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(),
            padding: EdgeInsets.all(10.0),
            child: FaIcon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }
}

class MainButtonTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainButton(
      icon: FontAwesomeIcons.carCrash,
      text: 'Motor accident',
      primaryColor: Color(0xff6989F5),
      secondaryColor: Color(0xff906EF5),
      onPress: () { print('clic'); },
    );
  }
}

class HeaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plusCircle,
      subtitle: 'Asistencia médica',
      title: 'Haz solicitado',
      primaryColor: Color(0xff526BF6),
      accentColor: Color(0xff67ACF2),
    );
  }
}

class ItemBoton {

  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.text, this.color1, this.color2 );
}