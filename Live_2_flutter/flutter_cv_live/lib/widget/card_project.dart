import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardProject extends StatelessWidget {
  String image;
  String title;
  String link;

  CardProject(this.image, this.title, this.link);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 27,
                  backgroundColor: Colors.white)),
          SizedBox(
            height: 5,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Lien du projet',
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launch(link);
                  },
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                    backgroundColor: Colors.white)),
          )
        ],
      ),
    );
  }
}
