// ignore_for_file: prefer_const_constructors
import 'package:basic_flutter/model/profile.dart';
import 'package:basic_flutter/screen/employee_select.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class employee extends StatefulWidget {
  const employee({super.key});

  @override
  State<employee> createState() => _employeeState();
}

class _employeeState extends State<employee> {
  Future<void> registeremployee(BuildContext context) async {
    String username = usernameController.text;
    String firstname = firstnameController.text;
    String lastname = lastnameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String skill = skillController.text;
    int phonenumber = int.parse(phonenumberController.text);
    //int otp = int.parse(otpController.text);

    try {
      print("hello");
      final Map<String, dynamic> data = {
        'Username': username,
        'Firstname': firstname,
        'Lastname': lastname,
        'email': email,
        'password': password,
        'phonenumber': phonenumber,
        'skill': skill,
        //'otp': otp,
      };

      var response = await http.post(
        Uri.parse(
            'http://10.64.69.56:5000/user'), // เปลี่ยนเป็น URL ของ Flask API ของคุณ
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer YourAccessTokenOrAPIKey',
          'Access-Control-Allow-Origin':
              '*', // ใช้ * หรือโดเมนที่เซิร์ฟเวอร์ยอมรับ
        },
        body: jsonEncode(data),
      );
      print("ho");

      if (response.statusCode == 201) {
        print("Registration Successful!");
        print("Response Body: ${response.body}");
      } else {
        print("Registration Failed!");
        print("Response Code: ${response.statusCode}");
        print("Response Body: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  //late final FirebaseAuth auth;
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final CollectionReference _registerCollection =
      FirebaseFirestore.instance.collection("RegisterEmployer");
  final formKey = GlobalKey<FormState>();
  // Profile profile = Profile(
  //     email: '',
  //     password: '',
  //     Firstname: '',
  //     Lastname: '',
  //     Username: '',
  //     Phonenumber: '',
  //     Otp: '',
  //     name_home: '',
  //     password_home: '',
  //     post_description: '',
  //     post_title: '');
  // get formattedData => null;
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController otpController = TextEditingController();

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
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("ผู้จ้างงาน",style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: formKey,
                child: Column(
                  //spacing: 200,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 20, 19, 0),
                      margin: EdgeInsets.only(left: 42, top: 10, bottom: 30),
                      width: 300,
                      height: 500,
                      decoration: BoxDecoration(
                          //border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          color: Colors.white),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Text("Username", style: TextStyle(fontSize: 20),),
                          TextFormField(
                            //initialValue: 'Username',
                            decoration: InputDecoration(
                              labelText: 'Username *',
                              //border: OutlineInputBorder()
                            ),
                            keyboardType: TextInputType.name,
                            onSaved: (String? Username) {
                              usernameController.text = Username!;
                            },
                          ),

                          TextFormField(
                            //initialValue: 'Firstname',
                            decoration: InputDecoration(
                              labelText: 'Firstname *',
                              //border: OutlineInputBorder()
                            ),
                            keyboardType: TextInputType.name,
                            onSaved: (String? Firstname) {
                              firstnameController.text = Firstname!;
                            },
                          ),

                          TextFormField(
                            //initialValue: 'Lastname',
                            decoration: InputDecoration(
                              labelText: 'Lastname *',
                              //border: OutlineInputBorder()
                            ),
                            keyboardType: TextInputType.name,
                            onSaved: (String? Lastname) {
                              lastnameController.text = Lastname!;
                            },
                          ),

                          TextFormField(
                            //initialValue: 'Phonenumber',
                            decoration: InputDecoration(
                              labelText: 'Phonenumber *',
                              //border: OutlineInputBorder()
                            ),
                            keyboardType: TextInputType.phone,
                            onSaved: (String? Phonenumber) {
                              phonenumberController.text = Phonenumber!;
                            },
                          ),

                          TextFormField(
                            //initialValue: 'Email',
                            decoration: InputDecoration(
                              labelText: 'Email *',
                              //border: OutlineInputBorder()
                            ),
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "pls enter Email."),
                              EmailValidator(errorText: "อีเมลไม่ถูกต้อง")
                            ]),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (String? email) {
                              emailController.text = email!;
                            },
                          ),
                          
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password *',
                              //border: OutlineInputBorder()
                            ),
                            keyboardType: TextInputType.text,
                            validator: RequiredValidator(
                                errorText: "pls enter your password"),
                            obscureText: true,
                            onSaved: (String? password) {
                              passwordController.text = password!;
                            },
                          ),
                          
                          // TextFormField(
                          //   decoration: InputDecoration(
                          //     labelText: 'Confirm Password *',
                          //     //border: OutlineInputBorder()
                          //   ),
                          //   controller: confirmpassword,
                          //   obscureText: true,
                          //   keyboardType: TextInputType.text,
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return 'Please re-enter password';
                          //     }
                          //     //print(password.text);
                          //     //print(confirmpassword.text);
                          //     if (password.text != confirmpassword.text) {
                          //       return "Password does not match";
                          //     }
                          //     return null;
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState?.save();
                            await registeremployee(context);
                            // _registerCollection.add({
                            //   'email': profile.email,
                            //   'password': profile.password,
                            //   'Username': profile.Username,
                            //   'Firstname': profile.Firstname,
                            //   'Lastname': profile.Lastname,
                            //   'joinedAt': formattedData,
                            //   'createdAt': Timestamp.now()
                            // });
                            formKey.currentState?.reset();
                            // ignore: use_build_context_synchronously
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return employeeSelect();
                            }));
                          }
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
    );
  }
}
