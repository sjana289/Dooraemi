import 'package:flutter/material.dart';
import '../Models/RadialProgress.dart';

class HomePageBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            RadialProgress(),
          ],
        )
      ],
    );
  }
}