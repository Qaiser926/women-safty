// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:women_safety/util/images.dart';

class Pharmacy extends StatelessWidget {
    final Function? onMapFunction;
  const Pharmacy({super.key,this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: (){
        onMapFunction!("Pharmacy near me");
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
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(WImage.pharmacy_pic),
                )),
            ),
              const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Pharmacy',style: TextStyle(fontSize: 12),),
            ),
            
          ],
        ),
      ),
    );
  }
}