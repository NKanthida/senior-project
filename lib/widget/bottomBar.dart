import 'package:basic_flutter/screen/FavScreens.dart';
import 'package:basic_flutter/screen/homepage.dart';
import 'package:basic_flutter/screen/search.dart';
import 'package:flutter/material.dart';

import '../screen/Post.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  List<Widget> Screens = [
    const login(),
    const FavScreen(),
    const PostScreen(),
    const Search()
  ];//list exceed

  List<IconData> listIcons = [
    Icons.home,
    Icons.favorite,
    Icons.topic,
    Icons.chat
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        
          body: Screens[_currentIndex],
          bottomNavigationBar: Container(
                  margin: const EdgeInsets.all(15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffF6E9D7),
                    borderRadius: BorderRadius.circular(20)),
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.024),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(duration: const Duration(milliseconds: 1500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          margin: EdgeInsets.only(
                            bottom: index == _currentIndex ? 0 : size.width * .029,
                            right: size.width * .0479,
                            left: size.width * .0422
                          ),
                          width: size.width*.128,
                          height: index == _currentIndex ? size.width * .014 : 0,
                          decoration: const BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10)
                            )),),
                            Icon(listIcons[index],
                            size: size.width*.076,
                            color: index == _currentIndex?Colors.teal:Colors.black45,),
                            SizedBox(height: size.width * .02,)
                        ],
                      ),
                    ),
                  ),
                ),),
    );
  }
}
// currentIndex: _currentIndex, //_selectedIndex,
//             onTap: (value) {
//               setState(() {
//                 _currentIndex = value;
//               });
//             },