// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_field, prefer_collection_literals

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:women_safety/child/child_Register_child.dart';
import 'package:women_safety/component/custom_textfield.dart';
import 'package:women_safety/component/primeryButton.dart';
import 'package:women_safety/component/secondryButton.dart';
import 'package:women_safety/db/share_pref.dart';
import 'package:women_safety/child/bottomBar/bottomPages/home.dart';
import 'package:women_safety/parent/parent_home.dart';
import 'package:women_safety/parent/parent_register_Screen.dart';
import 'package:women_safety/util/color.dart';
import 'package:women_safety/util/constants.dart';
import 'package:women_safety/util/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // for store field data without textEditingController
  final _formData = Map<String, Object>();
  bool isLoading = false;

  bool isPassword = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              isLoading
                  ? progressDialog(context)
                  : ListView(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "USER LOGIN",
                                style: TextStyle(
                                    color: primeryColor,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              Image.asset(
                                WImage.logo,
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomTextField(
                                  hintText: "Email",
                                  prefix: Icon(Icons.email),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  validate: (email) {
                                    if (email!.isEmpty) {
                                      return "Please Enter Correct Email";
                                    }
                                    return null;
                                  },
                                  onSave: (email) {
                                    _formData["email"] = email ?? "";
                                  },
                                ),
                                CustomTextField(
                                  keyboardType: TextInputType.visiblePassword,
                                  validate: (value) {
                                    if (value!.isEmpty || value.length < 4) {
                                      return "Please Enter Correct Password";
                                    }
                                    return null;
                                  },
                                  isPassword: isPassword,
                                  suffix: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isPassword = !isPassword;
                                        });
                                      },
                                      icon: isPassword
                                          ? Icon(Icons.visibility_off)
                                          : Icon(Icons.visibility)),
                                  onSave: (password) {
                                    _formData["password"] = password ?? "";
                                  },
                                  hintText: "Password",
                                  prefix: Icon(Icons.password),
                                ),
                                PrimeryButton(
                                  onpress: () {
                                    if (_formKey.currentState!.validate()) {
                                      _onSubmit();
                                    }
                                  },
                                  title: "LOGIN",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Forgot Password".toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      letterSpacing: 1.5),
                                ),
                                SecondryButton(
                                  onpress: () {},
                                  title: "Click Here",
                                ),
                              ],
                            ),
                            SecondryButton(
                              onpress: () {
                                goto(context, RegisterChild());
                              },
                              title: "Register as child",
                            ),
                            SecondryButton(
                              onpress: () {
                                goto(context, ParentRegisterScreen());
                              },
                              title: "Register as parent",
                            )
                          ],
                        )
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  _onSubmit() async {
    _formKey.currentState!.save();

    progressDialog(context);
    try {
      setState(() {
        isLoading = true;
      });
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _formData['email'].toString(),
        password: _formData['password'].toString(),
      );
      if (userCredential.user != null) {
        setState(() {
          isLoading = false;
        });
        FirebaseFirestore.instance
            .collection("childUser")
            .doc(userCredential.user!.uid)
            .get()
            .then((value) {
          if (value["type"] == "parent") {
            MySharedPreference.saveUserType("parent");
            goto(context, ParentHome());
          } else {
              MySharedPreference.saveUserType("child");
            goto(context, HomePage());
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          isLoading = false;
        });
        dialogBox(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        setState(() {
          isLoading = false;
        });
        dialogBox(context, 'Wrong password provided for that user.');
      }
    }
    log("data:${_formData['email']}");
    log("data:${_formData['password']}");
  }
}
