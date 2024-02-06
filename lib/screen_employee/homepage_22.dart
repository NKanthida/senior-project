//import 'package:basic_flutter/screen_employee/UserProfile.dart';
import 'package:basic_flutter/screen_employee/Employee_profile.dart';
import 'package:basic_flutter/screen_employee/des_post_employee.dart';
import 'package:basic_flutter/screen_employee/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class homepage_employee extends StatefulWidget {
  const homepage_employee({super.key});

  @override
  State<homepage_employee> createState() => _homepage_employeeState();
}

class _homepage_employeeState extends State<homepage_employee> {
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
            //extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: IconButton(
                icon: (const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.woolha.com/media/2020/03/eevee.png'))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) {
                    //return const Profile_employee();
                    return const EmployeeProfile();
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
                  icon: const Icon(Icons.notifications_none_rounded, color: Colors.black),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return const Search();
                    // }));
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
                              title: Text(data['Username'].toString(),
                                  style: const TextStyle(fontSize: 20)),
                              subtitle: const Text("รายละเอียดย่อของโพส"),//Text(data['email'].toString()),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const DesPost_employee();
                                }));
                              },
                            ),
                          )
                        ],
                      );
                    }).toList(),
                  );
                })
            //bottomNavigationBar: BottomBar(),
            ),
      ),
    );
  }
}
