import 'package:basic_flutter/screen/FavScreens.dart';
import 'package:basic_flutter/screen/Post.dart';
import 'package:basic_flutter/screen/Profile1.dart';
import 'package:basic_flutter/screen/Profile2.dart';
import 'package:basic_flutter/screen/ProfileCard.dart';
//import 'package:basic_flutter/screen_employee/UserProfile.dart';
import 'package:basic_flutter/screen/bgtinderpage.dart';
import 'package:basic_flutter/screen/chat.dart';
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
  var currentIndex = 0;

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
    Size size = MediaQuery.of(context).size;
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
          ]
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            //extendBodyBehindAppBar: true,
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
                                        //return const UserProfile();
                                        //return const SwipePage();
                                        return const bgtinderpage();
                                        //return MyWidget();
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
                          currentIndex = index;
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
                            bottom: index == currentIndex ? 0 : size.width * .029,
                            right: size.width * .0479,
                            left: size.width * .0422
                          ),
                          width: size.width*.128,
                          height: index == currentIndex ? size.width * .014 : 0,
                          decoration: const BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10)
                            )),),
                            Icon(listIcons[index],
                            size: size.width*.076,
                            color: index == currentIndex?Colors.teal:Colors.black45,),
                            SizedBox(height: size.width * .02,)
                        ],
                      ),
                    ),
                  ),
                ),
            ),
      ),
    );
  }
  List<IconData> listIcons = [
    Icons.home,
    Icons.favorite,
    Icons.topic,
    Icons.chat
  ];
  List<Widget> Screens = [
    const login(),
    const FavScreen(),
    const PostScreen(),
    const Chat()
  ];
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