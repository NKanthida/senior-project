import 'dart:io' show File;
import 'package:basic_flutter/model/profile.dart';
import 'package:basic_flutter/screen/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Formpost extends StatefulWidget {
  const Formpost({super.key});

  @override
  State<Formpost> createState() => _FormpostState();
}

class _FormpostState extends State<Formpost> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  CollectionReference _registerCollection =
      FirebaseFirestore.instance.collection("Post");
  final formkey = GlobalKey<FormState>();
  File? _image;
  final picker = ImagePicker();
  Future getImagefromCamera() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('ไม่มีรูปภาพที่เลือก');
      }
    });
  }

  Future getImagefromGallery() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('ไม่มีรูปภาพที่เลือก');
      }
    });
  }

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
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const PostScreen();
                })));
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                width: 80,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                child:const Column(
                  children: [
                    SizedBox(height: 7,),
                    Text('สร้าง', style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                  ],
                )
                // child: const ElevatedButton(
                //     child: Text(
                //       'Create',
                //       style: TextStyle(color: Colors.black),
                //     ),
                //     onPressed: () async {
                //       if (formKey.currentState!.validate()) {
                //         formKey.currentState?.save();
                //         await post.add({
                //           'post_title': profile.post_title,
                //           'post_description': profile.post_description,
                //           'createdAt': Timestamp.now()
                //         });
                //         formKey.currentState?.reset();
                //       }
                //     }
                // ),
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding:
                    const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
                width: 374,
                height: 635,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Text('หัวข้อ'),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          onSaved: (String? post_title) {
                            profile.post_title = post_title!;
                          },
                        ),
                        const SizedBox(
                          width: 50,
                          height: 50,
                        ),
                        const Text('รายละเอียด'),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          onSaved: (String? post_description) {
                            profile.post_description = post_description!;
                          },
                        ),
                        const SizedBox(
                          width: 50,
                          height: 50,
                        ),
                        const Text('รูปภาพ'),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(color: Colors.blueGrey),
                          child: Center(
                            child: _image == null
                                ? const Text('ใส่รูปภาพ')
                                : Image.file(_image!),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: getImagefromCamera,
                              child: const Icon(
                                Icons.camera,
                                size: 25,
                              ),
                            ),
                            SizedBox(width: 10,),
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: getImagefromGallery,
                              child: const Icon(
                                Icons.folder,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
