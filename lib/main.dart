import 'package:flutter/material.dart';
import 'screen/Homepage/HomePage.dart';
import 'screen/Recent.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Doorami",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFFB94E),
        iconTheme: IconThemeData(color: Colors.white)
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => Recent()
      },
    );
  }
}