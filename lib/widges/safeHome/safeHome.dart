// ignore_for_file: file_names, sized_box_for_whitespace, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:women_safety/util/images.dart';

class SafeHome extends StatefulWidget {
  
  @override
  State<SafeHome> createState() => _SafeHomeState();
}

class _SafeHomeState extends State<SafeHome> {
  // bottom sheet 
  SendLocationFunction(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        height: MediaQuery.of(context).size.height*0.4,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: const Card());
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>SendLocationFunction(context),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          decoration: const BoxDecoration(),
          height: 200,
          width: MediaQuery.of(context).size.width*0.7,
          child: Row(
            children: [
              Expanded(child: Column(
                children: const [
                  ListTile(
                    title: Text("Send Location"),
                    subtitle: Text("Share Location"),
                  ),
                ],
              )),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(WImage.route)),
            ],
          ),
        ),
      ),
    );
  }
}