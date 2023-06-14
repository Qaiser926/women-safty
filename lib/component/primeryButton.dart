// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:women_safety/util/color.dart';

class PrimeryButton extends StatelessWidget {
  final Function()? onpress;
  final String? title;
  final bool isLoading;
  const PrimeryButton({
    Key? key,
    this.onpress,
    this.title,
     this.isLoading=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity-50,
      height: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: primeryColor,
      onPressed: onpress, child:Text(title.toString(),style: const TextStyle(color: Colors.white,fontSize: 25,letterSpacing: 1.5),) );
  }
}
