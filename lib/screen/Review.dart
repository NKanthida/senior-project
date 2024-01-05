import 'package:flutter/material.dart';
//import 'package:rating_bar/rating_bar.dart';

class Review extends StatefulWidget{
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState(); 
}

class _ReviewState extends State<Review> {    
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //body: RatingBar(onRatingChanged: onRatingChanged, filledIcon: filledIcon, emptyIcon: emptyIcon)
    );
  }
}
