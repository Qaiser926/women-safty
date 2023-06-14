// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:women_safety/util/quates.dart';

class CustomAppBar extends StatelessWidget {
  int? quateIndex;
  Function()? onpress;
  CustomAppBar({this.onpress,this.quateIndex});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onpress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(SweetSaying[quateIndex!],style: const TextStyle(fontSize: 23),),
      ),
    );
  }
}