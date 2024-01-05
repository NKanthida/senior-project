import 'package:flutter/material.dart';

import '../database/homepage.dart';

class Typework extends StatefulWidget {
  const Typework({super.key});

  @override
  State<Typework> createState() => _TypeworkState();
}

class _TypeworkState extends State<Typework> {
  String? valuework;
  List<String> TWork = <String>[
    'ช่างประปา',
    'ช่างไฟฟ้า',
    'ช่างแอร์',
    'ช่างทาสี',
    'ช่างซ่อมเครื่องใช้ไฟฟ้า'
  ];
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
          appBar: AppBar(
            title: const Text("Type Of Work",style:TextStyle(color: Colors.black)),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 430.25),
                  margin: const EdgeInsets.only(top: 10, bottom: 30),
                  width: 300,
                  height: 500,
                  decoration: const BoxDecoration(
                      //border: Border.all(width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      color: Colors.white),
                  child: DropdownButton<String>(
                    alignment: Alignment.topLeft,
                    elevation: 16,
                    underline: Container(
                      height: 1,
                      color: Colors.black
                    ),
                    hint: const Text('เลือกประเภทอาชีพ'),
                    value: valuework,
                    onChanged: (value) {
                      setState(() {
                        valuework = value.toString();
                      });
                    },
                    items: TWork.map((item) {
                      return DropdownMenuItem<String>(
                          value: item,
                          child: SizedBox(
                              child: Center(
                            child: Text(item),
                          )));
                    }).toList(),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return const login();
                        }));
                      },
                      child: const Text("ถัดไป",
                          style: TextStyle(fontSize: 25, color: Colors.black))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
