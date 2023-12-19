import 'package:flutter/material.dart';



import 'package:flutter_bulb_iot/bulbcard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bulb_iot/weather.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  //adroid and flutter
  WidgetsFlutterBinding.ensureInitialized();

//intializing firebaise
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(getotp());
}

class getotp extends StatelessWidget {
  const getotp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.yellow,
            scaffoldBackgroundColor: Color.fromARGB(255, 4, 4, 4)),
        home: mainhome());
  }
}

class mainhome extends StatefulWidget {
  mainhome({super.key});

  @override
  State<mainhome> createState() => _mainhomeState();
}

class _mainhomeState extends State<mainhome> {
  List<Widget> page = [
    HomePage(),
    weathercard(),
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flash'),
        backgroundColor: Color.fromARGB(255, 247, 235, 211),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            tooltip: "setting icon",
          )
        ],
        toolbarHeight: 60.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: page[_index],
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "SMEC",
                style: TextStyle(
                    fontSize: 24, color: Color.fromARGB(255, 252, 252, 253)),
              ),
            ),
            ListTile(
              title: Text("gallery"),
              leading: Icon(Icons.photo_album),
            ),
            ListTile(
              title: Text('about'),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text('logout'),
              leading: Icon(Icons.logout),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          bottomnav("Home", Icons.home),
          bottomnav("Weather", Icons.wb_sunny_rounded),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomnav(String value, IconData iconss) {
    return BottomNavigationBarItem(
      icon: Icon(iconss),
      label: '$value',
    );
  }
}
