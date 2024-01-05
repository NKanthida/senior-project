import 'package:flutter/material.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
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
          
          //backgroundColor: Colors.lightBlue.shade50,
          appBar: AppBar(
            title: const Text('ที่กดใจไว้'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),body: const SafeArea(
            top: true,
            bottom: true,
            left: true,
            right: true,
            minimum: EdgeInsets.all(16.0),
            maintainBottomViewPadding: true,
            child: Text('ที่กดใจไว้'),
          ),
        ),
      ),
    );
  }
}