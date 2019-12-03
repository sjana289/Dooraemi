import 'package:flutter/material.dart';

class Knocks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 60,),
          Text('7 knocks today'),
        ],
      ),
    );
  }
}