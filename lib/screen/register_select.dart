import 'package:basic_flutter/screen/register.dart';
import 'package:basic_flutter/screen/register_employee.dart';
import 'package:flutter/material.dart';

class Regselect extends StatefulWidget {
  const Regselect({super.key});

  @override
  State<Regselect> createState() => _RegselectState();
}

class _RegselectState extends State<Regselect> {
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
          //appBar: AppBar(title: const Text("Register")),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(75, 50, 0, 0),
            child: Column(children: [
              const Text(
                'Register',
                style: TextStyle(fontSize: 32),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 55, 0, 30),
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    color: Colors.black),
                width: 250,
                height: 50,
                //alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const RegisterScreen();
                    }));
                  },
                  child: const Text("ผู้รับงาน",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    color: Colors.black),
                width: 250,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const employee();
                      }));
                    },
                    child:
                        const Text("ผู้จ้างงาน", style: TextStyle(fontSize: 20,color: Colors.white))),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
