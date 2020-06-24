class Temp {
  String main;
  String description;
  String icon;
  var temp;

  Temp(Map map) {
    List weather = map["weather"];
    Map weatherMap = weather.first;
    this.main = weatherMap["main"];
    this.description = weatherMap["description"];
    this.icon = weatherMap["icon"];
    Map mainMap = map["main"];
    this.temp = mainMap["temp"];
  }
}
