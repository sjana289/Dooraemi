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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(height: 70.0,width: 100.0,),
                    Text('Your Smart', style: TextStyle(
                      color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0
                      ),
                    ),
                  ],
                ),
                
                Text('Doorbell', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}