import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:women_safety/child/bottomBar/bottom_bar.dart';
import 'package:women_safety/child/child_loginScreen.dart';
import 'package:women_safety/db/share_pref.dart';
import 'package:women_safety/child/bottomBar/bottomPages/home.dart';
import 'package:women_safety/parent/parent_home.dart';
import 'package:women_safety/util/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await  MySharedPreference.init();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.firaSansTextTheme(
          Theme.of(context).textTheme
        )
      ),
      // ye b tik see kam kar raha ta
      // home: MySharedPreference.getUserType()=="parent"?ParentHome() : MySharedPreference.getUserType()=="child"?HomePage():LoginScreen()
    home: FutureBuilder(
      future: MySharedPreference.getUserType(),
      builder: (context,AsyncSnapshot snapshot){
        if(snapshot.data==""){
          return LoginScreen();
        }
        if(snapshot.data=="parent"){
          return ParentHome();
        }
        if(snapshot.data=="child"){
          return BottomPage();
        }
        return progressDialog(context);
      },
    ),
    );
  }
}