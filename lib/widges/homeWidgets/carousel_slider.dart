
// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:women_safety/util/quates.dart';
import 'package:women_safety/widges/homeWidgets/safeWebview.dart';

class CarouselSliders extends StatefulWidget {
  const CarouselSliders({super.key});

  @override
  State<CarouselSliders> createState() => _CarouselSlidersState();
}

class _CarouselSlidersState extends State<CarouselSliders> {
 void NivagorMethod(BuildContext context, route){
    Navigator.push(context, MaterialPageRoute(builder: (_)=>route));
  }
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        autoPlay: true,
        enlargeCenterPage: true
      ),
      items: List.generate(imageSliders.length, (index) =>Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            onTap: (){
              if(index==0){
                NivagorMethod(
                 context,SafeWebView(url: "https://play.google.com/store/apps/details?id=com.psca.ppic3.womensafety&hl=en&gl=US",)
                );
              }else if (index==1){
                NivagorMethod(context,SafeWebView(url: "https://punjabpolice.gov.pk/node/8931",));
              }else if(index==2){
                 NivagorMethod(context,SafeWebView(url: "https://www.unwomen.org/en/what-we-do/ending-violence-against-women/creating-safe-public-spaces",));
              }else if(index==3){
                 NivagorMethod(context,SafeWebView(url: "https://punjabpolice.gov.pk/node/8931",));
              }
            },
            child: Container(
              
              decoration: BoxDecoration(
               
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: NetworkImage(imageSliders[index]),fit: BoxFit.cover)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.6)
                    ,Colors.transparent
                   ]),),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(articleTitle[index].toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                    )),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}