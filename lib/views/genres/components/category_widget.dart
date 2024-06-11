import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_intern/theme/style.dart';

class CategoryWidget extends StatelessWidget {
  final String cateName;
  final VoidCallback onTap;
  const CategoryWidget({super.key,required this.cateName,required this.onTap});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width/2 ,
          height: 100.0,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color:  Colors.accents[random.nextInt(Colors.accents.length)],
          boxShadow: const[
            BoxShadow(
              offset: Offset(0, 3),
              color: Colors.black12,
              blurRadius: 6,
            ),
          ]
        ),
        child: Center(child: Text(cateName,style: Style().categoryStyle)),
      ),
    );
  }
}