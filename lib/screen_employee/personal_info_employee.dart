import 'package:flutter/material.dart';

class Personal_info_employee extends StatefulWidget {
  const Personal_info_employee({super.key});

  @override
  State<Personal_info_employee> createState() => _Personal_info_employeeState();
}

class _Personal_info_employeeState extends State<Personal_info_employee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
        margin: EdgeInsets.only(bottom: 0.1),
        width: 374,
        height: 380,
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   alignment: Alignment.center,
            //   margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            //   child: const CircleAvatar(

            //     backgroundImage: NetworkImage(
            //         'https://www.woolha.com/media/2020/03/eevee.png'),
            //     radius: 80,
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
              child: const Text(
                'เบอร์โทรศัพท์ : ' '064-4285976',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 25, 0, 0),
              child: const Text(
                'ทักษะ',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              //width: 50,
              // height: 45,

              margin: const EdgeInsets.fromLTRB(50, 20, 0, 0),
              // decoration: const BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.all(Radius.circular(15)),

              //   ),
              //child: const Center(
              child: const Text(
                'Electic',
                style: TextStyle(fontSize: 15),
              ),
              //),
            ),
          ],
        ),
      ),
    );
  }
}
