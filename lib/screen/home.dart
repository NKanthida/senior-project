// ignore_for_file: prefer_const_constructors
import 'package:auth/auth.dart';
import 'package:basic_flutter/screen/Post.dart';
import 'package:basic_flutter/screen/Profile2.dart';
import 'package:basic_flutter/screen/chat.dart';
import 'package:basic_flutter/screen/homepage.dart';
import 'package:basic_flutter/screen_employee/homepage_22.dart';
import 'package:basic_flutter/screen/register_select.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:basic_flutter/model/profile.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //TextEditingController usernameController = TextEditingController();

  // Future<bool> singin(BuildContext context) async {
  //   //employer
  //   String email = emailController.text;
  //   String password = passwordController.text;
  //   bool x = false;

  //   try {
  //     await AuthService().signInWithEmailPassword(email, password);
  //     print("เข้าสู่ระบบด้วยอีเมล์ : $email");
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("เข้าสู่ระบบสำเร็จ")));
  //     x = true;
  //     Navigator.push(context, MaterialPageRoute(builder: (context) {
  //       return login();
  //     }));
  //   } catch (e) {
  //     print("ไม่สามารถเข้าสู่ระบบได้ : $e");
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("ไม่สามารถเข้าสู่ระบบได้")));
  //   }
  //   print(x);
  //   return x;
  // }

  Future<void> signIn(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;
      try {
        var response = await http.post(
          Uri.parse('http://10.64.69.56:5000/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Access-Control-Allow-Origin':
                '*', // ใช้ * หรือโดเมนที่เซิร์ฟเวอร์ยอมรับ
          },
          body: jsonEncode(<String, String>{
            'email': email,
            'password': password,
          }),
        );
        if (response.statusCode == 200) {
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          String message = responseBody['message'];
          print('Response from server: $message');
          if (message == "Login successful!") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("เข้าสู่ระบบสำเร็จ")),
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => login()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("ไม่สามารถเข้าสู่ระบบได้")),
            );
          }
        } else {
          print("ไม่สามารถเข้าสู่ระบบได้: ${response.body}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("ไม่สามารถเข้าสู่ระบบได้")),
          );
        }
      } catch (e) {
        print("ไม่สามารถเข้าสู่ระบบได้: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("ไม่สามารถเข้าสู่ระบบได้")),
        );
      }
    }
  }

  Future<bool> signin2(BuildContext context) async {
    //employee
    String email = emailController.text;
    String password = passwordController.text;
    bool x = false;

    try {
      await AuthService().signInWithEmailPassword(email, password);
      print("เข้าสู่ระบบด้วยอีเมล์ : $email");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("เข้าสู่ระบบสำเร็จ")));
      x = true;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        //return MyApp();
        return homepage_employee();
      }));
    } catch (e) {
      print("ไม่สามารถเข้าสู่ระบบได้ : $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("ไม่สามารถเข้าสู่ระบบได้")));
    }
    print(x);
    return x;}

  

  Future<void> fetchUserProfile() async {
    try {
      final response = await http.get(
        Uri.parse('http://your-flask-server-url/user_profile'),
        // Add any necessary headers or parameters for your request
      );

      if (response.statusCode == 200) {
        // Parse and use the user profile data
        // Example: profile.fromJson(json.decode(response.body));
        print("User profile fetched successfully");
      } else {
        print("Failed to fetch user profile: ${response.statusCode}");
      }
    } catch (e) {
      print("Error during user profile fetch: $e");
    }
  }

  // ... (existing code)

  
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
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
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
                          margin: EdgeInsets.only(top: 20,bottom: 130),
                          
                          alignment: Alignment.center,
                          child: TextButton(
                                
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      signin2(context);
                                      //signIn(context);
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
                                  )),
                          // Row(
                          //   children: [
                          //     TextButton(
                                
                          //         onPressed: () async {
                          //           if (formKey.currentState!.validate()) {
                          //             signIn(context);
                          //             // print(x);
                          //             // if(singin(context)==true)
                          //             // {
                          //             //   print("success");
                          //             //   Navigator.push(context,
                          //             //      MaterialPageRoute(builder: (context) {
                          //             //    return login();
                          //             //  }));
                          //             // }
                          //           }
                          //         },
                          //         child: Text(
                          //           'คนจ้าง',
                          //           style: TextStyle(
                          //               fontSize: 20, color: Colors.black),
                          //         )),
                              
                          //     TextButton(
                          //         onPressed: () async {
                          //           if (formKey.currentState!.validate()) {
                          //             signin2(context);
                          //           }
                          //         },
                          //         child: Text(
                          //           'คนรับจ้าง',
                          //           style: TextStyle(
                          //               fontSize: 20, color: Colors.black),
                          //         )),
                          //   ],
                          // )
                         ),
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
