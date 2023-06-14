import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:women_safety/util/images.dart';

class Policeitem extends StatefulWidget {

  @override
  State<Policeitem> createState() => _PoliceitemState();
}

class _PoliceitemState extends State<Policeitem> {
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
          onTap: ()=>_callNumber("1715"),
          child: Container(
            width: 270,
            height: Get.size.height*0.21,
               decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
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
                      child: Image.asset(WImage.army_pic),
                    ),Text("Policeitem",style: TextStyle(
              
                      color: Colors.white,
                      fontSize: Get.size.width*0.05,
                      fontWeight: FontWeight.bold
                    ),),
                    Text("In case of emargncy policeitem call",style: TextStyle(
              
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
                        child: Text("1-1",style: TextStyle(
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