import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //StatelessWidget = ไม่มีตัวแปรเก็บสถานะต่างๆ  , StatefullWidget = มีตัวแปรเก็บสถานะต่างๆ
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("App webdev")),
        body: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
            const Center(
              child: Text("ระบบเปิด-ปิดไฟ",style: TextStyle(fontSize: 28),),
            ),
            //MyWidget("open "),
            //MyWidget("close")
            IconButton(onPressed: (){},
              icon: (const CircleAvatar(
              backgroundImage: NetworkImage('https://www.pngkey.com/png/full/52-521680_red-close-button-vector-clipart-image-smiley-pas.png'),
              
            ))),
            
            
          
            
          ],
        ),
      ),
    );
  }
}