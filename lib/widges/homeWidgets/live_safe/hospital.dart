import 'package:flutter/material.dart';
import 'package:women_safety/util/images.dart';

class Hospital extends StatelessWidget {
    final Function? onMapFunction;
  const Hospital({super.key,this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: (){
        onMapFunction!("Hospital near me");
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
                  padding: const EdgeInsets.all(8.0),
                  child:Image.asset(WImage.hospital_pic),
                )),
            ),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Hospital',style: TextStyle(fontSize: 12),),
            ),
          ],
        ),
      ),
    );
  }
}