import 'package:basic_flutter/screen/homepage.dart' show login;
import 'package:flutter/material.dart';

class SettingCheange extends StatefulWidget{
  const SettingCheange({super.key});

  @override
  State<SettingCheange> createState() => _SettingCheangeState();
}

class _SettingCheangeState extends State<SettingCheange>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const login();
                },
              ));
            },
          ),
          centerTitle: true, 
          title: const SizedBox(
              child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
            ),
          )),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),

        
    );
  }
}

