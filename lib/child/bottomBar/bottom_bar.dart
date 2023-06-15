// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:women_safety/child/bottomBar/bottomPages/chatPage.dart';
import 'package:women_safety/child/bottomBar/bottomPages/contactPage.dart';
import 'package:women_safety/child/bottomBar/bottomPages/home.dart';
import 'package:women_safety/child/bottomBar/bottomPages/profilePage.dart';
import 'package:women_safety/child/bottomBar/bottomPages/reviewPage.dart';

class BottomPage extends StatefulWidget {

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
int currentIndex=0;

  List<Widget> listData=[
    HomePage(),
    ContactPage(),
   const ChatPage(),
   const ProfilePage(),
   const ReviewPage()
  ];

  onTapped(index){
    setState(() {
       currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: listData[currentIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page_sharp),label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.reviews),label: "Review"),
        ],
      ),
    );
  }
}