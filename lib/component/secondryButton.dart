import 'package:flutter/material.dart';
import '../util/color.dart';

class SecondryButton extends StatelessWidget {
 final Function()? onpress;
  final String? title;
  const SecondryButton({
    Key? key,
    this.onpress,
    this.title,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // minWidth: double.infinity-50,
      // height: 60,
    
      // color: primeryColor,
      onPressed: onpress, child:Text(title.toString(),style: const TextStyle(color: Colors.blue,fontSize: 20,letterSpacing: 1.5),) );
  }
}