import 'package:basic_flutter/screen/Formpost.dart';
import 'package:basic_flutter/screen/UserProfile.dart';
import 'package:basic_flutter/screen/des_post.dart';
import 'package:basic_flutter/screen/homepage.dart';
import 'package:basic_flutter/widget/bottomBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
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
                  icon: const Icon(Icons.post_add_outlined, color: Colors.black),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return const Formpost();
                    })));
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
                              subtitle: Text(data['email'].toString()),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DesPost();
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
