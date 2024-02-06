import 'package:basic_flutter/model/profile.dart';
import 'package:basic_flutter/screen_employee/homepage_22.dart';
import 'package:basic_flutter/screen_employee/personal_info_employee.dart';
import 'package:basic_flutter/screen_employee/setting_employee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../screen/portfolio.dart';

class EmployeeProfile extends StatefulWidget {
  const EmployeeProfile({super.key});

  @override
  State<EmployeeProfile> createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile>
    with TickerProviderStateMixin {
  //final Future<FirebaseApp> firebase = Firebase.initializeApp();
  //CollectionReference _registerCollection =
  //    FirebaseFirestore.instance.collection("RegisterEmployer");
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
  

  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 2);
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
            extendBodyBehindAppBar: false,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const homepage_employee();
                    },
                  ));
                },
              ),
              centerTitle: true,
              title:  const SizedBox(
                  child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
              actions: [
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const setting2();
                    })); },)
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
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data!.docs.map((document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return Container(
                            margin: const EdgeInsets.fromLTRB(12, 0, 20, 15),
                            width: 374,
                            height: 600,
                            decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(2, 20, 10, 15),
                                  child: const Center(
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://www.woolha.com/media/2020/03/eevee.png'),
                                      radius: 80,
                                    ),
                                  ),
                                ),
                                // const SizedBox(
                                //   height: 20,
                                // ),
                                Text(
                                  data['Username'].toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40.0),
                                  child: Container(
                                    height: 1,
                                    width: 374,
                                    color: Colors.red,
                                  ),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    alignment: Alignment.center,
                                    child: TabBar(
                                        controller: _tabController,
                                        labelStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        labelColor: Colors.redAccent,
                                        unselectedLabelColor: Colors.black,
                                        isScrollable: true,
                                        indicatorColor: Colors.transparent,
                                        tabs: const [
                                          //Tab(text: "รีวิว"),
                                          Tab(text: 'ข้อมูลส่วนตัว'),
                                          Tab(text: 'ผลงาน'),
                                        ])),
                                Expanded(
                                    child: TabBarView(
                                        controller: _tabController,
                                        children: const <Widget>[
                                      Personal_info_employee(),
                                      Protfolio(),
                                    ]))
                              ],
                            ));
                      }).toList());
                })

            // Container(
            //   margin: EdgeInsets.fromLTRB(20, 120, 20, 0),
            //   width: 374,
            //   height: 635,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.rectangle,
            //     color: Colors.white,
            //     borderRadius: BorderRadius.all(Radius.circular(25)),
            //   ),

            //   child: Column(

            //     children: <Widget>[
            //       Container(
            //           margin: EdgeInsets.fromLTRB(2, 25, 10, 0),
            //           child: Center(
            //             child: CircleAvatar(
            //               backgroundImage: NetworkImage(
            //                   'https://www.woolha.com/media/2020/03/eevee.png'),
            //               radius: 80,
            //             ),
            //           )),
            //       Padding(
            //         padding: EdgeInsets.all(20.0),
            //         child: Text(
            //           'Username',
            //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //         ),
            //       ),

            //       Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 40.0),
            //         child: Container(
            //           height: 1,
            //           width: 374,
            //           color: Colors.red,
            //         ),
            //       ),

            //       Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25))),

            //         alignment: Alignment.center,
            //         child: TabBar(
            //           controller: _tabController,
            //           labelStyle: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
            //           labelColor: Colors.redAccent,
            //           unselectedLabelColor: Colors.black,
            //           isScrollable: true,
            //           //labelPadding: EdgeInsets.only(left: 20,right: 20),
            //           indicatorColor: Colors.transparent,
            //           tabs: [
            //             Tab(text: 'ข้อมูลส่วนตัว'),
            //             Tab(text: 'ผลงาน'),
            //             Tab(text: 'รีวิว'),
            //           ]),
            //       ),

            //       Expanded(
            //         child: TabBarView(
            //           controller: _tabController,
            //           children:<Widget> [
            //             Personal_info(), //ดึงเบอร์โทร
            //             Protfolio(),
            //             Review()
            //           ]),
            //       )

            //     ],

            //   ),

            // ),

            ),
      ),
    );
  }
}
