import 'package:basic_flutter/screen/Profile1.dart';
import 'package:basic_flutter/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:basic_flutter/screen/homepage.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //signout function
  Future signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Homescreen()));
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
                      return const Profile1();
                    },
                  ));
                },
              ),
              centerTitle: true,
              title: const SizedBox(
                  child: Text(
                'Profile',
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
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.fromLTRB(2, 50, 10, 0),
                      child: const Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.woolha.com/media/2020/03/eevee.png'),
                          radius: 80,
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.all( 50.0),
                    child: Text(
                      'Username',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
          
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Container(
                      
                      height: 1,
                      width: 374,
                      color: Colors.red,
                    ),
                  ),
          
                  const SizedBox(
                    child: Padding(
                      padding: EdgeInsets.all( 50.0),
                      child: Text(
                        'เบอร์โทรศัพท์ : 064-4285976',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
          
                  IconButton(onPressed: (() {
                    
                  }), 
                  icon: const Icon(Icons.edit)),
      
                  IconButton(onPressed: (() {
                    signOut();
                  }), 
                  icon: const Icon(Icons.logout))
          
                ],
          
              )),
              
            )),
      ),
    );
  }
}
