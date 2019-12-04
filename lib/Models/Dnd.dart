import 'package:flutter/material.dart';

class Dnd extends StatelessWidget {

  Color gradientOne = Color(0xFF0F2027);
  Color gradientTwo = Color(0xFF203A43);
  Color gradientThree = Color(0xFF2C5364);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [gradientOne, gradientTwo, gradientThree])
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Do Not Disturb', style: TextStyle(
              fontSize: 17.0, 
              color: Colors.white, 
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0
            ),
          ),
          Switch(
            value: false,
            onChanged: (bool e){},
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: Colors.lightBlueAccent,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
      