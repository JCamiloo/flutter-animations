import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/routes/routes.dart';
import 'package:headers/src/theme/theme.dart';

class LauncherScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Designs'),
        backgroundColor: appTheme.accentColor,
      ),
      drawer: _MainMenu(),
      body: _OptionList(),
    );
  }
}

class _MainMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;
  
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text('JO', 
                    style: TextStyle(
                      fontSize: 50, 
                      color: Colors.white
                    )
                  ),
                ),
              ),
            ),
            Expanded(
              child: _OptionList(),
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: accentColor
              ),
              title: Text('Dark mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
                onChanged: (value) => appTheme.darkTheme = value
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: accentColor),
                title: Text('Custom theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: accentColor,
                  onChanged: (value) => appTheme.customTheme = value
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
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: screenRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(screenRoutes[i].icon, color: appTheme.accentColor),
        title: Text(screenRoutes[i].title),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
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