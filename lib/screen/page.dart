// import 'package:basic_flutter/screen/FavScreens.dart';
// import 'package:basic_flutter/screen/Post.dart';
// import 'package:basic_flutter/screen/homepage.dart';
// import 'package:basic_flutter/screen/search.dart';
// import 'package:flutter/material.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   var pages = <Widget>[
//     const login(),
//     const FavScreen(),
//     const PostScreen(),
//     const Search()
//   ];

//   Future<List<BottomNavigationBarItem>> bottombarNav() async {
//     var listIcons = [Icons.home,
//     Icons.favorite,
//     Icons.topic,
//     Icons.chat];
//     List<BottomNavigationBarItem> bottombarNavItems = [];

//     for(var icon in listIcons)
//     {
//       var item = BottomNavigationBarItem(
//         icon: Icon(icon),
//         );
//       bottombarNavItems.add(item);
//     }

//     return bottombarNavItems;
//   }

//   int _navItemIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[_navItemIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _navItemIndex,
//         items: bottombarNav(),
//         onTap: (index) => 
//                 setState(() {_navItemIndex = index;}), 
                
//       ),
//     );
//   }
// }