import 'package:flutter/material.dart';

class CardExp extends StatefulWidget {
  @override
  _CardExpState createState() => _CardExpState();
}

class _CardExpState extends State<CardExp> {
  bool isOpen = false;
  List<String> skills = [
    "Architecture de l’API",
    'Architecture de la BDD',
    'Développement API REST',
    'Rédaction de spec fonctionnel pour nos partenaires',
    'Référent technique du projet',
    "Mise en place d’un système de messaging (sms, mail et notification)",
    "Mise en place d’un déploiement continue",
    "Gestion des livraisons (API, Sites et applications)",
    "Gestion des services S3, ECS et SNS d’Amazon"
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeInOutQuint,
        padding: EdgeInsets.all(8),
        duration: Duration(milliseconds: 600),
        height: isOpen ? 480 : 180,
        color: Theme.of(context).cursorColor,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.domain,
                        color: Theme.of(context).canvasColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Groupama",
                        style: TextStyle(
                            color: Theme.of(context).canvasColor, fontSize: 22),
                      ),
                    ],
                  ),
                  Text("Septembre 2018 à ce jour",
                      style: TextStyle(
                          color: Theme.of(context).canvasColor, fontSize: 14))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text("Ingénieur développeur FullStack",
                    style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontSize: 18,
                        fontStyle: FontStyle.italic)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBlaBlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBlaBlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla',
                style: TextStyle(color: Theme.of(context).canvasColor),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: (skills.length * 19).toDouble(),
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 1,
                  childAspectRatio: 20,
                  children: List.generate(skills.length, (index) {
                    return Text(
                      '• ${skills[index]}',
                      style: TextStyle(
                          color: Theme.of(context).canvasColor, fontSize: 14),
                    );
                  }),
                ),
              ),
              Text(
                "Environnement technique : ",
                style: TextStyle(
                    color: Theme.of(context).canvasColor,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'BACK :  Java j2ee, Rest, spring boot, spring data, hibernate, liquibase, mysql, ElasticSearch, docker, AWS S3, AWS ECS, AWS SNS, Magento',
                style: TextStyle(color: Theme.of(context).canvasColor),
              ),
              Text(
                'Application mobile : Ionic 4, angularjs, cordova, html, css, Firebase, Apple push notification',
                style: TextStyle(color: Theme.of(context).canvasColor),
              ),
              Text(
                'Application mobile : Ionic 4, angularjs, cordova, html, css, Firebase, Apple push notification',
                style: TextStyle(color: Theme.of(context).canvasColor),
              ),
              Text(
                'Autres : gitlab, git, sourcetree, JIRA, Confluence,',
                style: TextStyle(color: Theme.of(context).canvasColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
