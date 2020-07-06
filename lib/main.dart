import 'package:flutter/material.dart';
import 'package:kidsupp/ui/akis.dart';
import 'package:kidsupp/ui/ana_sayfa.dart';
import 'package:kidsupp/ui/bildirimler.dart';
import 'package:kidsupp/ui/mesajlar.dart';
import 'ui/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color learch = Color.fromARGB(255, 204, 170, 255);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learch',
      theme: ThemeData(
        primaryColor: learch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> tumSayfalar;
  Bildirimler bildirimler;
  AnaSayfa anaSayfa;
  MufredatBody mufredatBody;
  Mesajlar mesajlar;
  var keyAnaSayfa = PageStorageKey("keyAnaSayfa");
  var keyBildirim = PageStorageKey("keyBildirim");
  var keyMesaj = PageStorageKey("keyMesaj");
  var keyMufredat = PageStorageKey("keyMufredat");
  bool inAppPurchase = true;

  @override
  void initState() {
    bildirimler = Bildirimler(keyBildirim);
    anaSayfa = AnaSayfa(keyAnaSayfa);
    mufredatBody = MufredatBody();
    mesajlar = Mesajlar(keyMesaj);
    tumSayfalar = [anaSayfa, bildirimler, mesajlar, mufredatBody];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}, splashColor: Colors.blue.shade800, backgroundColor: Colors.blueAccent,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavMenu(),
      drawer: DrawerMenu(),
      appBar: GradientAppBar(
        title: Text("KidsUpp", style: TextStyle(color: Colors.white),),
        gradient: LinearGradient(colors: [Colors.blue, Colors.pink]),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _currentIndex <= tumSayfalar.length - 1
          ? tumSayfalar[_currentIndex]
          : null,
    );
  }

  BottomNavigationBar bottomNavMenu() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text("Ana Sayfa")),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), title: Text("Bildirimler")),
        BottomNavigationBarItem(
            icon: Icon(Icons.message), title: Text("Mesajlar")),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_books), title: Text("Müfredat")),
      ],
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          }
        );
      },
    );
  }
}