import 'package:flutter/material.dart';
import '../Clipper/CustomShapeClipper.dart';

class HomePageTopPart extends StatefulWidget {
  @override
  _HomePageTopPartState createState() => _HomePageTopPartState();
}

class _HomePageTopPartState extends State<HomePageTopPart> {

  Color firstColor = Color(0xFF7F7FD5);
  Color secondColor = Color(0xFF86A8E7);
  Color thirdColor = Color(0xFF91EAE4);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(clipper: CustomShapeClipper(), 
          child: Container(height: 400.0, 
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [firstColor, secondColor, thirdColor]
              )
            ),
          )
        )
      ],
    );
  }
}