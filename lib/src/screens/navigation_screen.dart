import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notification Screen'),
        ),
        floatingActionButton: FloatingButton(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          title: Text('Bones'),
          icon: FaIcon(FontAwesomeIcons.bone)
        ),
        BottomNavigationBarItem(
          title: Text('Notifications'),
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: AnimationContainer(),
              )
            ],
          )
        ),
        BottomNavigationBarItem(
          title: Text('My Dog'),
          icon: FaIcon(FontAwesomeIcons.dog)
        ),
      ],
    );
  }
}

class AnimationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final int notifications = Provider.of<_NotificationModel>(context).notifications;

    return BounceInDown(
      from: 10,
      animate: (notifications > 0) ? true : false,
      child: Bounce(
        from: 10,
        controller: (ctlr) => Provider.of<_NotificationModel>(context).bounceCtlr = ctlr,
        child: Container(
          child: Text(
            '$notifications', 
            style: TextStyle(
              color: Colors.white,
              fontSize: 7
            )
          ),
          alignment: Alignment.center,
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}


class FloatingButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
      onPressed: () {
        final notificationModel = Provider.of<_NotificationModel>(context, listen: false);
        
        int notification = notificationModel.notifications;
        notification++;
        notificationModel.notifications = notification;

        if (notification >= 2) {
          final ctrl = notificationModel.bounceCtlr;
          ctrl.forward(from: 0.0);
        }
      },
    );
  }
}

class _NotificationModel extends ChangeNotifier {

  int _notifications = 0;
  AnimationController _bounceCtlr;

  int get notifications => this._notifications;

  set notifications(int value) {
    this._notifications = value;
    notifyListeners();
  }

  AnimationController get bounceCtlr => this._bounceCtlr;

  set bounceCtlr(AnimationController ctlr) {
    this._bounceCtlr = ctlr;
  }
}