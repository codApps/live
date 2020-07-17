import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttercvlive/screen/profil_screen.dart';
import 'package:fluttercvlive/screen/projet_screen.dart';

import 'exp_screen.dart';
import 'formation_screen.dart';

class TabBarScreen extends StatefulWidget {
  Function switchTheme;

  TabBarScreen(this.switchTheme);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  var _indexPages = 0;

  List<Widget> pages = [
    ProfilScreen(),
    ExpScreen(),
    FormationScreen(),
    ProjetScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CV - CodApps'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.format_color_fill),
            onPressed: () {
              widget.switchTheme();
            },
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).backgroundColor,
        items: <Widget>[
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.update,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.school,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.phonelink,
            size: 30,
            color: Colors.white,
          )
        ],
        onTap: (index) {
          setState(() {
            _indexPages = index;
          });
        },
      ),
      body: pages[_indexPages],
    );
  }
}
