import 'package:basic_flutter/screen_employee/homepage_22.dart';
import 'package:basic_flutter/screen_employee/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DesPost_employee extends StatefulWidget {
  const DesPost_employee({super.key});

  @override
  State<DesPost_employee> createState() => DesPost_employeeState();
}

class DesPost_employeeState extends State<DesPost_employee> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.lightBlue.shade50,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const homepage_employee();
                })));
              },
            ),
            centerTitle: true,
            title: SizedBox(
              width: 90,
              child: Image.asset("assets/images/logo.png"),
            ),
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
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          //padding: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
                          width: 374,
                          height: 635,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20, left: 25),
                                child: Text(
                                  data['Username'].toString(),
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                margin: const EdgeInsets.only(),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context){
                                        return const Chat2();
                                      }) );
                                    },
                                    child: const Text("Send message to employer",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black))),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              })),
    );
  }
}
