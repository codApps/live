import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:http/http.dart' as http;
import 'package:live1/model/Temp.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:location/location.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen>
    with AutomaticKeepAliveClientMixin<WeatherScreen> {
  Location localisation = new Location();
  LocationData locationData;
  Stream<LocationData> stream;
  String nameCity = 'Recherche météo';
  Temp temp;

  AssetImage night = AssetImage("assets/img/n.jpg");
  AssetImage sun = AssetImage("assets/img/d1.jpg");

  @override
  void initState() {
    super.initState();
    listenToStream();
  }

  listenToStream() {
    stream = localisation.onLocationChanged;
    stream.listen((newPosition) {
      if (locationData == null) {
        setState(() {
          print(newPosition.altitude);
          print(newPosition.longitude);
          locationData = newPosition;
          locationToCity();
        });
      }
    });
  }

  locationToCity() async {
    if (locationData != null) {
      Coordinates coordinates =
          new Coordinates(locationData.latitude, locationData.longitude);
      final cityName =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      setState(() {
        nameCity = cityName.first.locality;
        api();
      });
    }
  }

  api() async {
    double lat;
    double lon;
    if (locationData != null) {
      lat = locationData.latitude;
      lon = locationData.longitude;

      final key = "&APPID=b6d45fa853c52350a31c9f1a9e8f65be";
      String lang = "&lang=fr";
      String baseApi = "http://api.openweathermap.org/data/2.5/weather?";
      String coordsString = "lat=$lat&lon=$lon";
      String units = "&units=metric";
      String url = baseApi + coordsString + units + lang + key;
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Map map = json.decode(response.body);
        print(map);
        setState(() {
          temp = Temp(map);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return temp == null
        ? Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(nameCity),
                Loading(
                  indicator: BallPulseIndicator(),
                  size: 100.0,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: getBackground(), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  nameCity,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  temp.description,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: getIcon(),
                    ),
                    Text(
                      "${temp.temp.toString()} °C",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                )
              ],
            ),
          );
  }

  AssetImage getIcon() {
    String icon = temp.icon.replaceAll('d', '').replaceAll('n', '');
    return AssetImage("assets/img/$icon.png");
  }

  AssetImage getBackground() {
    if (temp.icon.contains("n")) {
      return night;
    } else if (temp.icon.contains("d")) {
      return sun;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
