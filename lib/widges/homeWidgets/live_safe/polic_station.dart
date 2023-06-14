// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:women_safety/util/images.dart';
class PliceStation extends StatelessWidget {
  final Function? onMapFunction;
  const PliceStation({super.key,this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onMapFunction!("Police station near me");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(WImage.police_pic),
                ),)
            ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Plice Station',style: TextStyle(fontSize: 12),),
            ),
          ],
        ),
      ),
    );
  }
}