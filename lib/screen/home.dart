// ignore_for_file: prefer_const_constructors
import 'package:auth/auth.dart';
import 'package:basic_flutter/screen/Profile2.dart';
import 'package:basic_flutter/screen/homepage.dart';
import 'package:basic_flutter/screen/register_select.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:basic_flutter/model/profile.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw e; // จัดการข้อผิดพลาดตามที่คุณต้องการ
    }
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  //final Firebase _auth = FirebaseAuth.instance;
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //TextEditingController usernameController = TextEditingController();

  Future<bool> singin(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;
    bool x = false;

    try {
      await AuthService().signInWithEmailPassword(email, password);
      print("เข้าสู่ระบบด้วยอีเมล์ : $email");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("เข้าสู่ระบบสำเร็จ")));
      x = true;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return login();
      }));
    } catch (e) {
      print("ไม่สามารถเข้าสู่ระบบได้ : $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("ไม่สามารถเข้าสู่ระบบได้")));
    }
    print(x);
    return x;
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: SizedBox(
                        child: Image.asset("assets/images/Group 39_2.png"),
                      )),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 40, 10, 20),
                          child: Center(
                              child: Text(
                            "Login",
                            style: TextStyle(

                                //fontStyle: FontStyle.,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.transparent),
                          ))),
                      TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "username or email",
                            hintStyle: TextStyle(fontSize: 20)),
                        controller: emailController,
                        validator: RequiredValidator(
                            errorText: 'pls enter username or email'),
                        keyboardType: TextInputType.name,
                        onChanged: (String? email) {
                          profile.email = email!;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "password",
                            hintStyle: TextStyle(fontSize: 20)),
                        controller: passwordController,
                        validator: RequiredValidator(
                            errorText: 'pls enter username or email'),
                        obscureText: true,
                        keyboardType: TextInputType.name,
                        onChanged: (String? password) {
                          profile.password = password!;
                        },
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 77),
                          child: TextButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  singin(context);
                                  // print(x);
                                  // if(singin(context)==true)
                                  // {
                                  //   print("success");
                                  //   Navigator.push(context,
                                  //      MaterialPageRoute(builder: (context) {
                                  //    return login();
                                  //  }));
                                  // }
                                }
                              },
                              child: Text(
                                'Enter',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ))),
                      SizedBox(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Regselect();
                            }));
                          },
                          child: const Text("Create Account",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black54)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
