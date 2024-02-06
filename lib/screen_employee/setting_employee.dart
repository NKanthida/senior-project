import 'package:basic_flutter/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Employee_profile.dart';

class setting2 extends StatefulWidget {
  const setting2({super.key});

  @override
  State<setting2> createState() => setting2State();
}

class setting2State extends State<setting2> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //signout function
  Future signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Homescreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const EmployeeProfile();
                    },
                  ));
                },
              ),
              centerTitle: true,
              title: const SizedBox(
                  child: Text(
                'Setting',
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Container(
              margin: const EdgeInsets.fromLTRB(20, 59, 20, 0),
              width: 374,
              height: 635,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                              top: 20, left: 20, bottom: 20),
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://www.woolha.com/media/2020/03/eevee.png'),
                            radius: 55,
                          )),
                      const Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          'Username',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  //   child: Container(
                  //     height: 1,
                  //     width: 374,
                  //     color: Colors.red,
                  //   ),
                  // ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 270,
                            //height: 35,
                            margin:
                                const EdgeInsets.only(top: 30, bottom: 27),
                            decoration: BoxDecoration(color: Colors.blue[100],
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'เบอร์โทรศัพท์ : 064-4285976',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                //textAlign: TextAlign.center,
                              ),
                            ),
                          ),

                          Container(
                            width: 270,
                            //height: 35,
                            decoration: BoxDecoration(color: Colors.blue[100],
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                            margin: const EdgeInsets.only(bottom: 27),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "สภานะการทำงาน",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            width: 270,
                            //height: 40,
                            decoration: BoxDecoration(color: Colors.blue[100],
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                            margin: const EdgeInsets.only(bottom: 27),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text("การแจ้งเตือน",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),

                          Container(
                            width: 270,
                            //height: 40,
                            decoration: BoxDecoration(color: Colors.blue[100],
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                            margin: const EdgeInsets.only(bottom: 27),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text("เปลี่ยนโหมดการทำงาน",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),

                           SizedBox(
                            width: 270,
                            //height: 35,
                             child: Padding(
                               padding: const EdgeInsets.all(6.0),
                               child: TextButton(
                                 onPressed: () { signOut(); },
                                 child: const Text("ลงชื่อออก",
                                     style: TextStyle(
                                      color: Colors.black87,
                                         fontSize: 16,
                                         fontWeight: FontWeight.bold)),
                                 
                               ),
                             ),
                           ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
            )),
      ),
    );
  }
}
