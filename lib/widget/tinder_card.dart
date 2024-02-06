import 'package:basic_flutter/screen/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class TinderCard extends StatelessWidget {
  const TinderCard({super.key});

  //const MyWidget({super.key});
  //final colorr;
  //const TinderCard({required this.colorr});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            //shape: BoxShape.circle,
            //borderRadius:BorderRadius.all(Radius.circular(20)),
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
        child: Swipable(
            onSwipeRight: (finalPosition) {
              //profile
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UserProfile();
              }));
              print("u like this");
            },
            onSwipeLeft: (finalPosition) {
              print("dislike");
            },
            child: Container(
                //color: colorr,
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
            )))),
      ),
    );
  }
}
