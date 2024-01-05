import 'package:basic_flutter/screen/Profile1.dart';
import 'package:basic_flutter/screen/search.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 360,
        height: 800,
        clipBehavior: Clip.antiAlias,
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
                  return const Profile1();
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
          body: Stack(
            children: [
              Positioned(
                left: 145,
                top: 15,
                child: Container(
                  width: 80,
                  height: 81,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0.47,
                        top: 4.41,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(-0.06),
                          child: Container(
                            width: 75.48,
                            height: 76.70,
                            child: Stack(children: []),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 289,
                top: 33,
                child: Container(
                  width: 38,
                  height: 38,
                  child: Stack(children: []),
                ),
              ),
              Positioned(
                left: 271.12,
                top: 735.97,
                child: Container(
                  width: 39.88,
                  height: 37.84,
                  child: Stack(children: []),
                ),
              ),
              Positioned(
                left: 199,
                top: 734,
                child: Container(
                  width: 36.50,
                  height: 42,
                  child: Stack(children: []),
                ),
              ),
              Positioned(
                left: 48,
                top: 736,
                child: Container(
                  width: 40.78,
                  height: 38.86,
                  child: Stack(children: []),
                ),
              ),
              Positioned(
                left: 125,
                top: 738.25,
                child: Container(
                  width: 36.99,
                  height: 35.02,
                  child: Stack(children: []),
                ),
              ),
              Positioned(
                left: -4,
                top: 719.55,
                child: Container(
                  width: 367.07,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 82,
                top: 620,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 221,
                top: 620,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 21,
                top: 125,
                child: Container(
                  width: 322,
                  height: 310,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 39,
                top: 450,
                child: Container(
                  width: 290,
                  height: 156,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 133,
                top: 515,
                child: Text(
                  'description',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'PT Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 234,
                top: 638,
                child: Container(
                  width: 45,
                  height: 40,
                  child: Stack(children: []),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
