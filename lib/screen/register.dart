// ignore_for_file: prefer_const_constructors
import 'package:basic_flutter/model/profile.dart';
import 'package:basic_flutter/screen/Typeofwork.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen(
      {super.key}); //super key จะใช้เรียกตัวแปรที่เก็บในคลาสแม่มาใช้ super.ตัวแปรที่เก็บค่าไว้

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //late final FirebaseAuth auth;
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final CollectionReference _registerCollection =
      FirebaseFirestore.instance.collection("RegisterEmployer");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> isEmailRegiste(BuildContext context) async {
    // final QuerySnapshot querySnapshot =
    //     await FirebaseFirestore.instance
    //         .collection('users')
    //         .where('email', isEqualTo: email)
    //         .limit(1)
    //         .get();

    //return querySnapshot.docs.isNotEmpty;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print('ลงทะเบียนสำเร็จ');
      Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Typework();
                              }));

    } catch (e){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("ไม่สามารถลงทะเบียนได้")));
    }
  }

  // singup(){
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();
  //   String confirmpassword = confirmpasswordController.text.trim();
  //   if(password == confirmpasswordController && password.length >= 6){
  //     _auth.createUserWithEmailAndPassword(email: email, password: password).then((user){
  //       print("Sign up user successful.");
  //     }).catchError((error){
  //       print(error.message);
  //     });
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    //final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
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
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "ผู้รับงาน",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                  key: formKey,
                  child: Column(
                    //resizeToAvoidBottomInset:false,
                    //spacing: 200,
                    //if(!isKeyboard) buildLogo();
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 20, 19, 0),
                        margin: EdgeInsets.only(left: 42, top: 10, bottom: 30),
                        width: 300,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            //border: Border.all(width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            color: Colors.white),
                        child: Column(
                          children: <Widget>[
                            //Text("Username", style: TextStyle(fontSize: 20)),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Username *',
                                //border: OutlineInputBorder()
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter username';
                                }
                                return null;
                              },
                              onSaved: (String? Username) {
                                profile.Username = Username!;
                              },
                            ),

                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Firstname *',
                                //border: OutlineInputBorder()
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please a Enter Firstname';
                                }
                                return null;
                              },
                              onSaved: (String? Firstname) {
                                profile.Firstname = Firstname!;
                              },
                            ),

                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Lastname *',
                                //border: OutlineInputBorder()
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please a Enter Lastname';
                                }
                                return null;
                              },
                              onSaved: (String? Lastname) {
                                profile.Lastname = Lastname!;
                              },
                            ),

                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Phonenumber *',
                                //border: OutlineInputBorder()
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please a Enter Phonenumber';
                                }
                                return null;
                              },
                              onSaved: (dynamic Phonenumber) {
                                profile.Phonenumber = Phonenumber!;
                              },
                              maxLength: 10,
                              maxLengthEnforcement: MaxLengthEnforcement.none,
                            ),

                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email *',
                                //border: OutlineInputBorder()
                              ),
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  // if(formKey.currentState!.validate()){

                                  // }
                                  return 'Please Enter Email';
                                }
                                // else{
                                //   return 'Please Enter Email';
                                // }
                                // bool isTaken = await isEmailRegiste(value);
                                // if(isTaken){
                                //   return 'This Email is used';
                                // }
                                return null;
                              },
                              // onFieldSubmitted: (value) async {
                              //   if (formKey.currentState!.validate()) {
                              //     bool emailExists =
                              //         await isEmailRegiste(value);
                              //     if (emailExists) {

                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //         SnackBar(
                              //             content: Text("มีอีเมล์นี้แล้ว")),
                              //       );
                              //       print('email is used');
                              //     }
                              //   }
                              // },
                              onSaved: (String? email) {
                                profile.email = email!;
                              },
                            ),

                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password *',
                                //border: OutlineInputBorder()
                              ),
                              controller: passwordController,
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please a Enter Password';
                                }
                                return null;
                              },
                              //obscureText: true,
                              onSaved: (String? password) {
                                profile.password = password!;
                              },
                            ),

                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Confirm password *',
                                //border: OutlineInputBorder()
                              ),
                              controller: confirmpasswordController,
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please re-enter password';
                                }
                                print(passwordController.text);
                                print(confirmpasswordController.text);
                                if (passwordController.text != confirmpasswordController.text) {
                                  return "Password does not match";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: TextButton(
                          onPressed: () async {
                            
                            if (formKey.currentState!.validate()) {
                              isEmailRegiste(context);
                              // String email = emailController.text;
                              // //bool emailExists = await isEmailRegiste(email);
                              // if (email.isNotEmpty) {
                              //   bool emailExists = await isEmailRegiste(email);
                              //   if (emailExists) {
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(content: Text("มีอีเมล์นี้แล้ว")),
                              //     );
                              //   }
                              //   else{
                              //     print('success');
                              //   }
                              // }
                              // formKey.currentState?.save();
                              // await _registerCollection.add({
                              //   'email': profile.email,
                              //   'password': profile.password,
                              //   'Username': profile.Username,
                              //   'Firstname': profile.Firstname,
                              //   'Lastname': profile.Lastname,
                              //   'joinedAt': formattedData,
                              //   'createdAt': Timestamp.now()
                              // });

                              // if (kDebugMode) {
                              //   print("successful");
                              // }
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return Typework();
                              // }));

                              //return;
                             } //else {
                            //   if (kDebugMode) {
                            //     print("Unsuccessfull");
                            //   }
                            //   //formKey.currentState?.reset();
                            // }
                          },
                          child: Text("ถัดไป",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black)),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
