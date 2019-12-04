import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class DashboardList extends StatefulWidget {
  @override
  _DashboardListState createState() => _DashboardListState();
}

class _DashboardListState extends State<DashboardList> {
  
  final String url = "https://randomuser.me/api/?results=1";
  List data;
  bool isLoading = false;

  Future getData() async {
    var request = await http.get(
      Uri.encodeFull(url)
    );

    List convertDataToJson = jsonDecode(request.body)['results'];
    setState(() {
      data = convertDataToJson;
    });
  }

  @override
  void initState(){
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: isLoading
        ? CircularProgressIndicator()
        : ListView.builder(
          shrinkWrap: true,
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (context,i){
            return Card(
              elevation: 20.0,
              color: Color(0xFFeef5fa),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Image(
                      image: NetworkImage(data[i]['picture']['thumbnail']),
                      width: 80.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: Column(                        
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[                          
                        ListTile(
                          title: Text(
                            data[i]['location']['city'] + ", " + data[i]['location']['street']['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              fontFamily: 'Amatic',
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 10.0,),
                            RaisedButton(
                              child: Icon(Icons.mic),
                              onPressed: (){},
                              color: Color(0xFFaef879),
                              padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),
                            ),
                            RaisedButton(
                              child: Icon(Icons.message),
                              onPressed: (){},
                              color: Color(0xFF8acaf6),
                              padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),
                            ),
                            RaisedButton(
                              child: Icon(Icons.voicemail),
                              onPressed: (){},
                              color: Color(0xFFfbd0f2),
                              padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),
                            ),
                          ],  
                        ),
                        SizedBox(height: 5.0,)
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}