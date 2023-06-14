
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:women_safety/widges/homeWidgets/live_safe/bust_stadiio.dart';
import 'package:women_safety/widges/homeWidgets/live_safe/hospital.dart';
import 'package:women_safety/widges/homeWidgets/live_safe/pharmacy.dart';
import 'package:women_safety/widges/homeWidgets/live_safe/polic_station.dart';

class LiveSafe extends StatefulWidget {
  const LiveSafe({super.key});

  @override
  State<LiveSafe> createState() => _LiveSafeState();
}

class _LiveSafeState extends State<LiveSafe> {
  static Future<void> openMap(String location)async{
    String  googlemap="https://www.google.com/maps/search/$location";
    Uri uri=Uri.parse(googlemap);
    try {
      await launchUrl(uri);
    } catch (e) {
     Get.snackbar("SomeThing Went Wrong Call emergency number","" );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: const[
          PliceStation(onMapFunction: openMap),
          Hospital(onMapFunction: openMap),
          Pharmacy(onMapFunction: openMap),
          BusStadio(onMapFunction: openMap),
        ],
      ),
    );
  }
}