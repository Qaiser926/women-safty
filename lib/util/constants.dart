import 'package:flutter/material.dart';
import 'package:women_safety/util/color.dart';


void goto(BuildContext context , Widget nextScreen){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>nextScreen)); 
}

Widget progressDialog(BuildContext context) {
 return  Center(child: CircularProgressIndicator(
        backgroundColor: primeryColor,
        color: Color.fromARGB(255, 184, 18, 7),
        strokeWidth: 7,
      ));
}

dialogBox(BuildContext context,String title) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
      ));
}
