import 'package:basic_flutter/widget/tinder_card.dart' show TinderCard;
import 'package:flutter/material.dart';

class SwipePage extends StatefulWidget {
  const SwipePage({super.key});

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            
            width: 300,
            height: 400,
            // decoration: const BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(15))),
            //borderRadius:BorderRadius.all(Radius.circular(20)),
           alignment: Alignment.center,
           padding: const EdgeInsets.all(16),
          child: Stack(
            children: [TinderCard(),
            TinderCard(),
            TinderCard(),
            ]
          ),
          ),
        ),
      ));
  }
}