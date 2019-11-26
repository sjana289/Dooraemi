import 'package:flutter/material.dart';
import './HomePageTopPart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedPage=2;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doorami',style: TextStyle(color: Colors.white)),
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('La Tien', style: TextStyle(color: Colors.black),),
              accountEmail: Text('stupidnarcos@vietnam.in', style: TextStyle(color: Colors.black)),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://i.ytimg.com/vi/Dg-9PtlKzXg/maxresdefault.jpg'),
                  fit: BoxFit.cover
                )
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://statici.behindthevoiceactors.com/behindthevoiceactors/_img/chars/dorami-doraemon-2005-53.7.jpg'),
              ),
            ),
            ListTile(
              title: Text('Recent'),
              trailing: Icon(Icons.add_to_home_screen),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            ListTile(
              title: Text('History'),
              trailing: Icon(Icons.history),
              onTap: (){},
            ),
            ListTile(
              title: Text('Do Not Disturb'),
              trailing: Icon(Icons.do_not_disturb),
              onTap: (){},
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          HomePageTopPart()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        onTap: (int index){
          setState(() {
            selectedPage: index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            title: Text('Call')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History')
          ),
        ],
      ),
    );
  }
}