import 'package:flutter/material.dart';
import 'package:fluttercvlive/widget/card_exp.dart';
import 'package:fluttercvlive/widget/header.dart';

class ExpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: <Widget>[
          Header(Icon(Icons.update), 'Expériences'),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Theme.of(context).canvasColor,
          ),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.all(10),
                itemBuilder: (BuildContext ctx, int index) {
                  return CardExp();
                },
                separatorBuilder: (BuildContext ctx, int index) {
                  return SizedBox(height: 15);
                },
                itemCount: 3),
          )
        ],
      ),
    );
  }
}
