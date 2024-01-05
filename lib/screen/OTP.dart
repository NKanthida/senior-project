import 'package:basic_flutter/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:basic_flutter/model/profile.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(
      email: '',
      password: '',
      Firstname: '',
      Lastname: '',
      Username: '',
      Phonenumber: '',
      Otp: '',
      name_home: '',
      password_home: '', post_description: '', post_title: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('OTP'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 15,
              ),
              const Text("ใส่รหัส OTP", style: TextStyle(fontSize: 20)),
              TextFormField(
                keyboardType: TextInputType.name,
                onSaved: (String? Otp) {
                  profile.Otp = Otp!;
                },
              ),

              //หน้าถัดไป
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      child: const Text("ถัดไป", style: TextStyle(fontSize: 15)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          //ใส่หน้าหลัก
                          return const login();
                        }));
                      })),
            ],
          )),
        ));
  }
}
