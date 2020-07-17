import 'package:flutter/material.dart';

import 'screen/tab_bar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isNormalTheme = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV',
      theme: isNormalTheme
          ? ThemeData(
              primarySwatch: Colors.blue,
              backgroundColor: Colors.white,
              canvasColor: Colors.blue,
              cursorColor: Color(0xFFf2f2f2),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            )
          : ThemeData(
              primarySwatch: createMaterialColor(Color(0xFF313133)),
              backgroundColor: Colors.black87,
              canvasColor: Colors.white,
              cursorColor: Colors.black12,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
      home: TabBarScreen(switchTheme),
    );
  }

  void switchTheme() {
    setState(() {
      isNormalTheme = !isNormalTheme;
    });
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
