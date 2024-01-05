import 'package:flutter/material.dart';

class Protfolio extends StatefulWidget {
  const Protfolio({super.key});

  @override
  State<Protfolio> createState() => _ProtfolioState();
}

class _ProtfolioState extends State<Protfolio> {
  List photo = [
    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80,width: 150,height: 150'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 374,
      height: 800,
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Center(
            child: Wrap(
              //alignment: WrapAlignment.center,
              //spacing: 10.0,
              alignment: WrapAlignment.center,
              children: [
                Image.network('https://www.woolha.com/media/2020/03/eevee.png',
                    width: 100, height: 100),
                Image.network('https://www.woolha.com/media/2020/03/eevee.png',
                    width: 100, height: 100),
                Image.network('https://www.woolha.com/media/2020/03/eevee.png',
                    width: 100, height: 100)
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
