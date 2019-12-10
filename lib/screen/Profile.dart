import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

  final String value;

  Profile({Key key, @required this.value}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.value),
    );
  }
}