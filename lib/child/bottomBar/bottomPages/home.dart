// ignore_for_file: sized_box_for_whitespace, must_be_immutable, use_key_in_widget_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:women_safety/widges/safeHome/safeHome.dart';
import 'package:women_safety/widges/homeWidgets/card.dart';

import 'package:women_safety/widges/homeWidgets/carousel_slider.dart';
import 'package:women_safety/widges/homeWidgets/custom_appbar.dart';
import 'package:women_safety/widges/homeWidgets/live_safe.dart';
class HomePage extends StatefulWidget {
  int qIndex=0;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  getRandomIndex(){
    Random random=Random();
    setState(() {
      
   widget.qIndex=random.nextInt(6);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRandomIndex();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // height: 180,
          width: Get.size.width,
          child: Column(
            
            children: [
              CustomAppBar(quateIndex: widget.qIndex,onpress: getRandomIndex,),
             

              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                     const CarouselSliders(),
                     const Padding(
                       padding:  EdgeInsets.all(8.0),
                       child: Text('Emergency',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      
                     ),
                     const Emargencies(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Explore Live Safe',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                      ),
                      const LiveSafe(),
                      SafeHome(),
                  ],
                ),
              ),
             
           
            ],
          ),
        ),
      ),
    );
  }
}