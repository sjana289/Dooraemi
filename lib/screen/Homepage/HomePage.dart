import 'package:flutter/material.dart';
import './HomePageTopPart.dart';
import './HomePageBottomPart.dart';
import '../../Models/Knocks.dart';
import '../../Models/DashboardList.dart';
import '../../Models/Dnd.dart';
import './BottomDesign.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ScrollController _mycontroller = new ScrollController();
  int selectedPage=0;  
  var dndToggleValue;

  @override
  void initState(){
    super.initState();
    dndToggleValue = false;
  }

  dndToggle(bool e){
    setState(() {
      dndToggleValue = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doorami',style: TextStyle(color: Colors.white)),
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
      drawer: Drawer(
        elevation: 3.0,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('La Tien', style: TextStyle(color: Colors.black),),
              accountEmail: Text('stupidnarcos@vietnam.in', style: TextStyle(color: Colors.black)),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://previews.123rf.com/images/liveincosmos/liveincosmos1803/liveincosmos180300038/98521288-abstract-pastel-watercolor-background-.jpg'),
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
              trailing: Switch(
                value: dndToggleValue,
                onChanged: this.dndToggle,
                inactiveTrackColor: Colors.grey,
                inactiveThumbColor: Colors.lightBlueAccent,
                activeColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
      body: Container(  
        height: 600,              
        child: Stack(children: <Widget>[
          SingleChildScrollView(
            controller: _mycontroller,
            child: Column(
              children: <Widget>[
                HomePageTopPart(),
                SizedBox(height: 20),
                HomePageBottomPart(),
                SizedBox(height: 80),
                Knocks(),
                SizedBox(height: 30),
                Text('Latest Activity', style: TextStyle(
                  fontFamily: 'Cabin',
                  height: 4.0,
                  letterSpacing: 5.0,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 20),
                DashboardList(),
                SizedBox(height: 50),
                Dnd(),
                BottomDesign()
              ],
            ),
          )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        unselectedItemColor: Color(0xFF718093),
        selectedItemColor: Color(0xFFfa983a),
        onTap: (int index){
          setState(() {
            selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            title: Text('Recent'),
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