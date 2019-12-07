import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Recent extends StatefulWidget {
  @override
  _RecentState createState() => _RecentState();
}

class _RecentState extends State<Recent> {

  final String url = "https://randomuser.me/api/?results=4";
  List data;
  bool isLoading=false;

  Color notRead = Color(0xFFaef879);
  Color read = Color(0xFFbdc3c7);
  Color notificationColor;

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
    //notificationColor = notRead;
  }

  Color initColor(){
    return notRead;
  }

  Color setColor(){
    return read;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent',style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.account_circle),
            iconSize: 32.0,
            color: Colors.white,
          )
        ],
        backgroundColor: Color(0xFF30336b),
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                    fontFamily: 'Amatic',
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(width: 20.0,),
                                  RaisedButton(
                                    child: Text('Tap to Reply', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                                    onPressed: (){
                                      this.setColor();
                                    },
                                    color: Color(0xFF5758BB),
                                    padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,5.0),
                                  ),
                                ],  
                              ),
                              SizedBox(height: 5.0,),
                            ],
                          ),
                        ),
                        Container(
                          color: this.initColor(),
                          width: 10.0,
                          height: 80.0,
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
