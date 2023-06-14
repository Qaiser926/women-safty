// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class SafeWebView extends StatelessWidget {
  final String? url;
  SafeWebView({this.url});
  @override
  Widget build(BuildContext context) {
return SafeArea(
  child:   WebView(
  
    initialUrl: url,
  
  ),
);
  
  }
}