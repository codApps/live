import 'package:flutter/material.dart';
import 'package:fluttercvlive/widget/header.dart';

class ProfilScreen extends StatelessWidget {
  List<String> skills = [
    'Flutter',
    'Java',
    'Android',
    'iOS',
    'Ionic',
    'Dart',
    'Spring',
    'AWS',
    'Jira',
    'Git',
    'Agile'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(Icon(Icons.person), 'Développeur Mobile'),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Theme.of(context).canvasColor,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.contact_mail,
                color: Theme.of(context).canvasColor,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Contact",
                style: TextStyle(
                    color: Theme.of(context).canvasColor, fontSize: 25),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.mail,
                color: Theme.of(context).canvasColor,
              ),
              SizedBox(
                width: 22,
              ),
              Text(
                "fournierdavid49@yahoo.fr",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).canvasColor,
                    fontSize: 16),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.phone,
                color: Theme.of(context).canvasColor,
              ),
              SizedBox(
                width: 22,
              ),
              Text(
                "06 32 13 74 33",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).canvasColor,
                    fontSize: 16),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.person,
                color: Theme.of(context).canvasColor,
              ),
              SizedBox(
                width: 22,
              ),
              Text(
                "26 ans",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).canvasColor,
                    fontSize: 16),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.directions_car,
                color: Theme.of(context).canvasColor,
              ),
              SizedBox(
                width: 22,
              ),
              Text(
                "Permis B et A2",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).canvasColor,
                    fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.card_travel,
                color: Theme.of(context).canvasColor,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Compétences",
                style: TextStyle(
                    color: Theme.of(context).canvasColor, fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 5,
              children: List.generate(skills.length, (index) {
                return Text('• ${skills[index]}',
                    style: TextStyle(
                        color: Theme.of(context).canvasColor, fontSize: 16));
              }),
            ),
          )
        ],
      ),
    );
  }
}
