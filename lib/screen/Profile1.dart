import 'package:basic_flutter/model/profile.dart';
import 'package:basic_flutter/screen/home.dart';
import 'package:basic_flutter/screen/setting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:basic_flutter/screen/homepage.dart';

class Profile1 extends StatefulWidget {
  const Profile1({super.key});

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> with TickerProviderStateMixin {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //signout function
  Future signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Homescreen()));
  }
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(
      email: '',
      password: '',
      Firstname: '',
      Lastname: '',
      Username: '',
      Phonenumber: '',
      Otp: '',
      name_home: '',
      password_home: '',
      post_description: '',
      post_title: '');
  get formattedData => null;
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
                      return const login();
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
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const setting();
                    }));
                  },
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('RegisterEmployer')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView(
                    children: snapshot.data!.docs.map((document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    
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
                            margin: const EdgeInsets.fromLTRB(2, 45, 10, 0),
                            child: const Center(
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://www.woolha.com/media/2020/03/eevee.png'),
                                radius: 80,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            data['Username'].toString(),
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        
                        Container(
                          width: 290,
                          height: 48,
                          decoration: const BoxDecoration(color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 13, 0, 0),
                            child: Text(
                              //'PhoneNumber',
                              data['Phonenumber'].toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        

                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                          width: 290,
                          height: 48,
                          decoration: const BoxDecoration(color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20, 13, 0, 0),
                            child: Text(
                              'Notification',
                              //data['Phonenumber'].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                          width: 290,
                          height: 48,
                          decoration: const BoxDecoration(color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(20, 13, 0, 0),
                            child: Text(
                              'Change Passwords',
                              //data['Phonenumber'].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 13, 0, 0),
                          width: 290,
                          height: 48,
                          decoration: const BoxDecoration(color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                          child: ElevatedButton(
                            onPressed: () { signOut(); },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                              )
                            ),
                            child: const Text(
                              'Logout',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        
                      ],
                    )),
                  );
                }).toList()
                );
              },
            )
            ),
      ),
    );
  }
}
