import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/routes/routes.dart';

class LauncherScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Designs'),
      ),
      drawer: _MainMenu(),
      body: _OptionList(),
    );
  }
}

class _MainMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('JO', style: TextStyle(fontSize: 50)),
                ),
              ),
            ),
            Expanded(
              child: _OptionList(),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
              title: Text('Dark mode'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: Colors.blue,
                onChanged: (value) {}
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: Colors.blue),
                title: Text('Custom theme'),
                trailing: Switch.adaptive(
                  value: true,
                  activeColor: Colors.blue,
                  onChanged: (value) {}
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OptionList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: Colors.blue,
      ),
      itemCount: screenRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(screenRoutes[i].icon, color: Colors.blue),
        title: Text(screenRoutes[i].title),
        trailing: Icon(Icons.chevron_right, color: Colors.blue),
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (BuildContext context) => screenRoutes[i].screen)
          );
        },
      ),
    );
  }
}