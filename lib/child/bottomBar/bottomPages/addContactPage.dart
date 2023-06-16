
// ignore_for_file: unnecessary_this, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:women_safety/child/bottomBar/bottomPages/contactPage.dart';
import 'package:women_safety/component/primeryButton.dart';
import 'package:women_safety/db/db_services.dart';
import 'package:women_safety/model/contactModel.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  DatabaseHelper databasehelper = DatabaseHelper();
  List<ContactModel>? contactList;
  int count = 0;

  void showList() {
    Future<Database> dbFuture = databasehelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<ContactModel>> contactListFuture =
          databasehelper.getContactList();
      contactListFuture.then((value) {
        setState(() {
          this.contactList = value;
          this.count = value.length;
        });
      });
    });
  }

 

  void deleteContact(ContactModel contact)async{
    int result =await databasehelper.deleteContact(contact.id);
  if(result!=0){
       Fluttertoast.showToast(msg: "contact removed succesfully");
      showList();
  }
  }

  @override
  void initState() {
    showList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              PrimeryButton(
                  title: "Add Trusted Contacts",
                  onpress: () async {
                    bool result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactPage(),
                        ));
                    if (result == true) {
                      showList();
                    }
                  }),
              Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: count,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(contactList![index].name),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      await FlutterPhoneDirectCaller.callNumber(
                                          contactList![index].number);
                                    },
                                    icon: const Icon(
                                      Icons.call,
                                      color: Colors.red,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      deleteContact(contactList![index]);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
