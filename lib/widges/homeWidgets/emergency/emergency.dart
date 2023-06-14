// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:women_safety/util/images.dart';

class Emargencyitem extends StatefulWidget {

  @override
  State<Emargencyitem> createState() => _EmargencyitemState();
}

class _EmargencyitemState extends State<Emargencyitem> {
    _callNumber(String number) async{
  await FlutterPhoneDirectCaller.callNumber(number);
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,bottom: 6),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
           onTap: ()=>_callNumber("1122"),
          child: Container(
            width: 270,
            height: Get.size.height*0.21,
               decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: const [
              Color(0xfffd8080),
              Color(0xfffb8580),
              Color(0xfffbd079),
            ])
            
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.asset(WImage.emer_pic),
                    ),Text("Active Emergency",style: TextStyle(
              
                      color: Colors.white,
                      fontSize: Get.size.width*0.05,
                      fontWeight: FontWeight.bold
                    ),),
                    Text("Call 0-1-5",style: TextStyle(
              
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      fontSize: Get.size.width*0.045,
                      fontWeight: FontWeight.bold
                    ),),
                    Container(
                      height: 30,
                      width: 80,
                      
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child:     Center(
                        child: Text("0-1-5",style: TextStyle(
                        color: Colors.red.shade300,
                        overflow: TextOverflow.ellipsis,
                        fontSize: Get.size.width*0.045,
                        fontWeight: FontWeight.bold
                    ),),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}