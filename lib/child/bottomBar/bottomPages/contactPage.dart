// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:women_safety/util/color.dart';
import 'package:women_safety/util/constants.dart';

class ContactPage extends StatefulWidget {
   @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
   
   List<Contact> contact=[];
  @override
  void initState() {
    super.initState();
    askPermission();
  }

  Future askPermission()async{
    PermissionStatus permissionStatus= await getContactPermission();
    if(permissionStatus==PermissionStatus.granted){
      getContact();
    }else{
      handleInvalidPermission(permissionStatus);
    }
  }
  handleInvalidPermission(PermissionStatus permissionStatus)async{
    if(permissionStatus==PermissionStatus.denied){
      dialogBox(context, "Access to the contact denied by the user");
    }else if(permissionStatus==PermissionStatus.permanentlyDenied){
      dialogBox(context, "May contact does not exit");
    }
  }
 Future<PermissionStatus> getContactPermission()async{

  PermissionStatus permission=await Permission.contacts.status;
  if(permission!= PermissionStatus.granted && permission!=PermissionStatus.permanentlyDenied){
 PermissionStatus permissionStatus=await Permission.contacts.request();
 return permissionStatus;
  }
  return permission;
 

  }
  getContact()async{
    List<Contact> _contact=await ContactsService.getContacts();
    setState(() {
      contact=_contact;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contact.length==0?Center(child: CircularProgressIndicator()):
       ListView.builder(
         itemCount: contact.length,
         itemBuilder: (context,index){
          Contact contacts=contact[index];
          return ListTile(
            leading: contacts.avatar!=null && contacts.avatar!.length>0?
             CircleAvatar(
               backgroundColor: primeryColor,
              backgroundImage: MemoryImage(contacts.avatar!),
            ):CircleAvatar(
              backgroundColor: primeryColor,
              child: Text(contacts.initials()),
            ),
            subtitle: Text(contacts.phones!.first.value!),
            title: Text(contacts.displayName!),
          );
         },
      ),
    );
  }
}