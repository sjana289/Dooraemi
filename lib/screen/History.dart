import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  final String url = "https://randomuser.me/api/?results=4";
  List data;
  bool isLoading=false;
  Color notRead = Color(0xFFaef879);
  Color read = Color(0xFFbdc3c7);

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
        title: Text('History',style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.blueGrey),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.account_circle),
            iconSize: 32.0,
            color: Colors.black,
          )
        ],
        //backgroundColor: Color.fromRGBO(r, g, b, opacity),
      ),
      body: Stack(
        children: <Widget>[
          Container(
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
                                title: Text(
                                  data[i]['location']['city'] + ", " + data[i]['location']['street']['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 25.0,
                                    fontFamily: 'Verdana',
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(width: 30.0,),
                                  RaisedButton(
                                    child: Text('Tap for pending reply', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                                    onPressed: (){},
                                    color: Color(0xFF5758BB),
                                    padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),
                                  ),
                                ],  
                              ),
                              SizedBox(height: 10.0,),
                            ],
                          ),
                        ),
                        Container(
                          color: Color(0xFFff0000),
                          width: 20.0,
                          height: 90.0,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

