import 'package:basic_flutter/screen/Post.dart';
import 'package:basic_flutter/screen/UserProfile.dart';
import 'package:basic_flutter/screen/search.dart';
import 'package:basic_flutter/widget/bottomBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:basic_flutter/model/profile.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
      post_description: '', post_title: ''
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: (const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.woolha.com/media/2020/03/eevee.png'))),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return const PostScreen();
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
                  return Column(
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                      Card(
                        child: ListTile(
                          minLeadingWidth: 10,
                          minVerticalPadding: 20,
                          leading: IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const UserProfile();
                                  },
                                ));
                              },
                              icon: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/little-cute-maltipoo-puppy-royalty-free-image-1652926025.jpg?crop=0.444xw:1.00xh;0.129xw,0&resize=980:*'),
                              )),
                          title: Text(data['Username'].toString(),
                              style: const TextStyle(fontSize: 20)),
                          subtitle: Text(data['email'].toString()),
                        ),
                      )
                    ],
                  );
                }).toList(),
              );
            }),
            //bottomNavigationBar: const BottomBar(),
        );
  }
}

// class bottomBar extends StatefulWidget{
//   const bottomBar({super.key});

//   @override
//   State<bottomBar> createState() => _bottomBarState();
// }

// class _bottomBarState extends State<bottomBar> {
//   int currentIndex = 0;

//   final List<Map<String, dynamic>> Screens = [
//     {'title': '', 'icon': Icons.home, 'page': const login()},
//     {
//       'title': '',
//       'icon': Icons.explore,
//       'page': const FavScreen(),
//     },
//     {
//       'title': '',
//       'icon': Icons.note,
//       'page': const PostScreen(),
//     },
//     {'title': '', 'icon': Icons.chat, 'page': const Text('chat')}
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Screens[currentIndex]['page'],
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           iconSize: 30,
//           elevation: 0,
//           //showSelectedLabels: false,
//           currentIndex: currentIndex, //_selectedIndex,
//           onTap: onTapped,
//           items: Screens.map((route) {
//             return BottomNavigationBarItem(
//                 icon: Icon(route['icon']), label: route['title']);
//           }).toList(),
//         ));
//   }

//   void onTapped(index) {
//     setState(() {
//       currentIndex = index;
//     });
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => Screens[index]['page']));
//   }
// }