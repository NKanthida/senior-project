import 'package:basic_flutter/database/homepage.dart';
import 'package:basic_flutter/screen/Profile1.dart';
import 'package:basic_flutter/screen/Profile2.dart';
import 'package:basic_flutter/screen/UserProfile.dart';
import 'package:basic_flutter/screen/search.dart';
import 'package:basic_flutter/widget/tinder_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class bgtinderpage extends StatefulWidget {
  const bgtinderpage({Key? key}) : super(key: key);

  @override
  State<bgtinderpage> createState() => _bgtinderpageState();
}

class _bgtinderpageState extends State<bgtinderpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        //width: double.infinity,
        height: 350,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment(0.43, 0.85),
          colors: [
            Color.fromRGBO(120, 255, 215, 1),
            Color.fromRGBO(101, 234, 204, 1),
            Color.fromRGBO(0, 122, 145, 1)
          ],
          //stops: [0.1, 0.56, 1]
        )),
        // const ShapeDecoration(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(
        //       bottomLeft: Radius.circular(64),
        //       bottomRight: Radius.circular(64),
        //     ),
        //   ),
        //   gradient: LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment(0.43, 0.85),
        //     colors: <Color>[
        //       Color.fromRGBO(120, 255, 215, 1),
        //       Color.fromRGBO(101, 234, 204, 1),
        //       Color.fromRGBO(0, 122, 145, 1)
        //     ],
        //   ),
        // ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: IconButton(
              icon: (const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.woolha.com/media/2020/03/eevee.png'))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const login();
                })));
              },
            ),
            centerTitle: true,
            title: SizedBox(
              width: 90,
              child: Image.asset("assets/images/logo.png"),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Search();
                  }));
                },
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Stack(children: [
            Swipable(
                onSwipeRight: (finalPosition) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const UserProfile();
                  }));
                },
                child: Container(
                  height: 250,
                  width: 300,
                  margin: const EdgeInsets.fromLTRB(50, 100, 0, 0),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                )),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 100),
              child: const Text(
                "data",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.fromLTRB(97, 520, 0, 0),
              decoration: const BoxDecoration(
                  color: Colors.redAccent, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cancel,
                    size: 48,
                  )),
            ),
            Container(
              height: 80,
              width: 80,
              margin: const EdgeInsets.fromLTRB(220, 520, 0, 0),
              decoration: const BoxDecoration(
                  color: Colors.green, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const UserProfile();
                    }));
                  },
                  icon: const Icon(
                    Icons.favorite_rounded,
                    size: 48,
                  )),
            ),
          ]),
          // bottomNavigationBar: const BottomAppBar(
          //   child: Padding(
          //     padding: EdgeInsets.all(8),
          //     child: Row(
          //       children: [Text("data"), SizedBox(width: 20), Text("2")],
          //     ),
          //   ),
          // ),

          //SwipePage()
          //  const Padding(
          //   padding: EdgeInsets.only(top: 100, left: 120),
          //   child: SwipePage()
          // ),
        ),
      ),
    );
  }
}
