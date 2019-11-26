import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Recent extends StatefulWidget {
  @override
  _RecentState createState() => _RecentState();
}

class _RecentState extends State<Recent> {

  final String url = "https://randomuser.me/api/?results=3";
  List data;
  bool isLoading=false;

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent',style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.account_circle),
            iconSize: 32.0,
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        child: Center(
          child: isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (context,i){
              return Card(
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
                            leading: Icon(Icons.person),
                            title: Text(
                              data[i]['location']['city'] + ", " + data[i]['location']['street']['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.0,
                                fontFamily: 'Amatic',
                              ),
                            ),
                          ),
                          // ListTile(
                          //   leading: Icon(Icons.calendar_today),
                          //   title: Text(
                          //     data[i]['dob']['date']
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
