// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:women_safety/widges/homeWidgets/emergency/alert.dart';
import 'package:women_safety/widges/homeWidgets/emergency/emergency.dart';
import 'package:women_safety/widges/homeWidgets/emergency/fire.dart';
import 'package:women_safety/widges/homeWidgets/emergency/police.dart';

class Emargencies extends StatefulWidget {
  const Emargencies({super.key});

  @override
  State<Emargencies> createState() => _EmargenciesState();
}

class _EmargenciesState extends State<Emargencies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
    //  height: Get.size.height,

    height: 180,
     child: ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        Emargencyitem(),
        Fireitem(),
        Policeitem(),
        AlertItem()
      ],
     ),
    );
  }
}