import 'dart:io';

import 'package:basic_flutter/database/homepage.dart';
import 'package:basic_flutter/screen/FavScreens.dart';
import 'package:basic_flutter/screen/Post.dart';
import 'package:basic_flutter/screen/home.dart';
import 'package:basic_flutter/screen/search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//StatelessWidget ไม่ต้องเปลี่ยนแปลงบ่อยหรือคงที่ แบบทำครั้งเดียว
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Match Work",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const Homescreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// class Mainpage extends StatefulWidget {
//   const Mainpage({super.key});

//   @override
//   State<Mainpage> createState() => _MainpageState();
// }

// class _MainpageState extends State<Mainpage> {
//   var pages = <Widget>[
//     const login(),
//     const FavScreen(),
//     const PostScreen(),
//     const Search()
//   ];
//   int _navItemIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[_navItemIndex],
//       bottomNavigationBar: BottomNavigationBar(
//        type: BottomNavigationBarType.shifting,
//        selectedItemColor: Colors.yellow,
//        unselectedItemColor: Colors.white,
//        showSelectedLabels: true,
//        showUnselectedLabels: true,
//        currentIndex: _navItemIndex,
//        items: bottomNavitem(),
//        onTap: (value) => setState(() {
//          _navItemIndex= value;
//        }),
//       ),
    
//     List<BottomNavigationBar> bottomNavitem(){
//       var listIcons = [Icons.home,
//     Icons.favorite,
//     Icons.topic,
//     Icons.chat];

//     var listTitles=["Home","Favourites", "Topics" ,"Search"];

//     var bgColors = [
//       Colors.deepPurple, Colors.indigo,
//       Colors.teal, Colors.brown
//     ];

//     var len = listIcons.length;

//     return List.generate(len, (index) => 
//     BottomNavigationBarItem(
//       icon: Icon(listIcons[index]),
//       label : listTitles[index],
//       backgroundColor: bgColors[index]
//       )
//     );
//     }
    
//     );

    
//   }
// }
