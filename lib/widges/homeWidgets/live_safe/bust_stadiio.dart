// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:women_safety/util/images.dart';

class BusStadio extends StatelessWidget {
    final Function? onMapFunction;
  const BusStadio({super.key,this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: (){
        onMapFunction!("Bus Stop near me");
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
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(WImage.busStop_pic),
                )),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Bus Studio',style: TextStyle(fontSize: 12),),
            ),
          ],
        ),
      ),
    );
  }
}