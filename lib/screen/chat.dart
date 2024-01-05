
import 'dart:io';

import 'package:basic_flutter/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  // List<Message> message = [
  //   text: ' ',
  //   date: DateTime.now().subtract(Duration(minutes:1)),
  //   isMe: false
  // ].reversed.toList();

   File? _image;
   final picker = ImagePicker();
  // Future getImagefromCamera() async {
  //   final pickedImage = await picker.getImage(source: ImageSource.camera);

  //   setState(() {
  //     if (pickedImage != null) {
  //       _image = File(pickedImage.path);
  //     } else {
  //       print('ไม่มีรูปภาพที่เลือก');
  //     }
  //   });
  // }

  Future getImagefromGallery() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } 
      // else {
      //   print('ไม่มีรูปภาพที่เลือก');
      // }
    });
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
          appBar: AppBar(
            centerTitle:  true,
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
            title: const Text('ชื่อผู้ใช้',textAlign: TextAlign.center,style: TextStyle(color: Colors.black87),),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.phone,color: Colors.black87,)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert,color: Colors.black87))
            ],
          backgroundColor: Colors.transparent,
          elevation: 0,),
          body: Column(
            children: [Row(
              children: [
                IconButton(onPressed: getImagefromGallery, 
                icon: Icon(Icons.photo)),

                Container(
                width: 240,
                decoration: BoxDecoration(color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20)),
                
                child: const TextField(
                  decoration: InputDecoration(contentPadding: EdgeInsets.all(12),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Type your message here'),
                ),
              ),


              IconButton(onPressed: (){

              }, 
              icon: Icon(Icons.send_rounded,size: 35,))
              ],
            )
              
            ],
          ),
        ),
      ));
  }
}

class Message{
  final String text;
  final bool isMe;
  final DateTime date;
  Message({required this.text, required this.isMe,required this.date});
}