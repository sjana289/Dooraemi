import 'package:flutter/material.dart';
import 'screen/HomePage.dart';
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
        accentColor: Color(0xFFF5D76E),
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => Recent()
      },
    );
  }
}