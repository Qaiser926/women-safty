import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:women_safety/child/child_loginScreen.dart';
import 'package:women_safety/component/custom_textfield.dart';
import 'package:women_safety/component/primeryButton.dart';
import 'package:women_safety/component/secondryButton.dart';
import 'package:women_safety/model/parent_model.dart';
import 'package:women_safety/model/user_model.dart';
import 'package:women_safety/util/color.dart';
import 'package:women_safety/util/constants.dart';
import 'package:women_safety/util/images.dart';

class ParentRegisterScreen extends StatefulWidget {
  const ParentRegisterScreen({super.key});

  @override
  State<ParentRegisterScreen> createState() => _ParentRegisterScreenState();
}

class _ParentRegisterScreenState extends State<ParentRegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  // for store field data without textEditingController
  final _formData = Map<String, Object>();

  bool isPassword = false;
  bool isLoading = false;
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
                                "REGISTER CHILD USER",
                                textAlign: TextAlign.center,
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
                            //  height: MediaQuery.of(context).size.height * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomTextField(
                                  hintText: "Name",
                                  prefix: Icon(Icons.person),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  validate: (name) {
                                    if (name!.isEmpty) {
                                      return "Please Enter Correct Name";
                                    }
                                    return null;
                                  },
                                  onSave: (name) {
                                    _formData["name"] = name ?? "";
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                CustomTextField(
                                  hintText: "Phone",
                                  prefix: Icon(Icons.phone),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  validate: (name) {
                                    if (name!.isEmpty) {
                                      return "Please Enter Correct phone";
                                    }
                                    return null;
                                  },
                                  onSave: (phone) {
                                    _formData["phone"] = phone ?? "";
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
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
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                CustomTextField(
                                  hintText: "Enter child Email",
                                  prefix: Icon(Icons.email),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  validate: (gemail) {
                                    if (gemail!.isEmpty) {
                                      return "Please Enter Correct child Email";
                                    }
                                    return null;
                                  },
                                  onSave: (cemail) {
                                    _formData["cemail"] = cemail ?? "";
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
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
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                CustomTextField(
                                  keyboardType: TextInputType.visiblePassword,
                                  validate: (value) {
                                    if (value!.isEmpty || value.length < 4) {
                                      return "Please Enter Correct Retype Password";
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
                                  onSave: (rPassword) {
                                    _formData["rPassword"] = rPassword ?? "";
                                  },
                                  hintText: "Retype Password",
                                  prefix: Icon(Icons.password),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        SecondryButton(
                          onpress: () {
                            goto(context, LoginScreen());
                          },
                          title: "LOGIN WITH YOUR ACCOUNT",
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
    if (_formData['password'] != _formData['rPassword']) {
    } else {
      progressDialog(context);
      try {
        setState(() {
          isLoading = true;
        });
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _formData['email'].toString(),
                password: _formData['password'].toString());

        if (userCredential.user != null) {
          final value = userCredential.user!.uid;
          final db =
              FirebaseFirestore.instance.collection("childUser").doc(value);
          final tojson = ParentModel(
            email: _formData['email'].toString(),
            cEmail: _formData['cemail'].toString(),
            id: value,
            name: _formData['name'].toString(),
            type: "parent"
          );
          db.set(tojson.toJson()).whenComplete(() {
            goto(context, LoginScreen());
            setState(() {
              isLoading = false;
            });
          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          setState(() {
            isLoading = false;
          });
          dialogBox(context, 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          setState(() {
            isLoading = false;
          });
          dialogBox(context, 'The account already exists for that email.');
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        dialogBox(context, e.toString());
      }
    }
    log("data:${_formData['email']}");
    log("data:${_formData['password']}");
  }
}
