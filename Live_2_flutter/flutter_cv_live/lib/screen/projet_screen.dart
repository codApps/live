import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttercvlive/model/Projet.dart';
import 'package:fluttercvlive/widget/card_project.dart';
import 'package:fluttercvlive/widget/header.dart';

class ProjetScreen extends StatelessWidget {
  List<Projet> _projet = [
    Projet(
        image: 'assets/img/codapps.png',
        title: 'Chaîne Youtube et Twitch - CodApps',
        link: 'https://www.youtube.com/channel/UCmq5KmzdGIw8tKJUs0hLgQw'),
    Projet(
        image: 'assets/img/scoregames.png',
        title: 'Score Games',
        link:
            'https://play.google.com/store/apps/details?id=com.radeonisos.score_games'),
    Projet(
        image: 'assets/img/defiabs.webp',
        title: 'DefiAbs',
        link:
            'https://play.google.com/store/apps/details?id=com.entreprise.davfou.abschallenge')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: <Widget>[
          Header(Icon(Icons.phonelink), 'Projets'),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Theme.of(context).canvasColor,
          ),
          Expanded(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return CardProject(_projet[index].image, _projet[index].title,
                    _projet[index].link);
              },
              itemCount: 3,
              loop: true,
              scrollDirection: Axis.vertical,
              pagination: new SwiperPagination(),
              control: new SwiperControl(),
              viewportFraction: 0.8,
              scale: 0.9,
              itemWidth: 300.0,
              itemHeight: 400.0,
              layout: SwiperLayout.TINDER,
            ),
          )
        ],
      ),
    );
  }
}
