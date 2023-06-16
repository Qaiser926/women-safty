// ignore_for_file: file_names, sized_box_for_whitespace, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:women_safety/component/primeryButton.dart';
import 'package:women_safety/db/db_services.dart';
import 'package:women_safety/model/contactModel.dart';
import 'package:women_safety/util/images.dart';

class SafeHome extends StatefulWidget {
  
  @override
  State<SafeHome> createState() => _SafeHomeState();
}

class _SafeHomeState extends State<SafeHome> {
  // for background current location
  Position? _currentPosition;
  String? _currentAddrss;
  LocationPermission? position;

  
  _getPermission()async =>await [Permission.sms].request();
  _permissionGranted()async => await Permission.sms.status.isGranted;
  _sendSms(String phoneNumber, String message , {int? simSlot})async{
    return BackgroundSms.sendMessage(phoneNumber: phoneNumber, message: message,
    simSlot: simSlot
    ).then((SmsStatus status) {
      if(status=="sent"){
        Fluttertoast.showToast(msg: "Sent");
      }
    else{
        Fluttertoast.showToast(msg: "failed");
    }
    });
  }
  
  // for background current location
  _getCurrentLocation()async{
    position=await Geolocator.checkPermission();
    if(position==LocationPermission.denied){
      position= await Geolocator.requestPermission();
      Fluttertoast.showToast(msg: "permission denied");
      if(position==LocationPermission.deniedForever){
         Fluttertoast.showToast(msg: "permission is permanently denied");
      }
    }
    Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      forceAndroidLocationManager: true
    ).then((Position position) {
      setState(() {
        _currentPosition=position;
        _getAddressFromLocation();
      });
    }).catchError((e){
      Fluttertoast.showToast(msg: e.toString());
    });
  }
  // for background current location
  _getAddressFromLocation()async{
    try {
      List<Placemark> placeMarks=await placemarkFromCoordinates(_currentPosition!.latitude,_currentPosition!.longitude);
      Placemark place=placeMarks[0];
      setState(() {
        _currentAddrss="${place.locality} , ${place.postalCode} , ${place.street}";
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  // bottom sheet 
  SendLocationFunction(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        height: MediaQuery.of(context).size.height*0.4,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child:  Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("SEND TOUR CURRENT LOCATION IMMEDIATELY TO YOU EMERGENCY CONTACTS",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
               if(_currentPosition!=null) Text(_currentAddrss.toString()),
                PrimeryButton(onpress: (){
                  _getCurrentLocation();
                },title: "GET LOCATION",),
                PrimeryButton(onpress: ()async{
                  List<ContactModel> contactList=await DatabaseHelper().getContactList();
                String recipient='';
                int i=1;
                for (ContactModel contact in contactList) {
              // when we send single sms
                // recipient = recipient + ";";
                // when send sms with multiple people
                recipient += contact.number;

                if(i!=contactList.length){
                  recipient+=";";
                  i++;
                }
                String messageBody="https://www.google.com/maps/search/?api=1&query=${_currentPosition!.latitude}%2C${_currentPosition!.longitude}. $_currentAddrss";
                if(await _permissionGranted()){
                  contactList.forEach((element) {
                    _sendSms(element.number, "I am in trouble please reach me at ${messageBody}");
                  });
                }
                }
                },title: "SEND ALERT",),
              ],
            ),
          ),
        ));
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPermission();
    _getCurrentLocation();
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