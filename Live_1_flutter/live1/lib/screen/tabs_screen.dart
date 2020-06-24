import 'package:flutter/material.dart';
import 'package:live1/screen/profil_screen.dart';
import 'package:live1/screen/weather_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('test'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                showAboutDialog(
                  applicationIcon: Container(
                    width: 50,
                    child: Image.asset(
                      'assets/img/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  context: context,
                  applicationVersion: '0.0.1',
                  applicationLegalese:
                      'Retrouvez ici toutes les informations lié aux licences.',
                );
              },
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.wb_sunny),
              ),
              Tab(
                icon: Icon(Icons.person),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            WeatherScreen(),
            ProfilScreen(),
          ],
        ),
      ),
    );
  }
}
