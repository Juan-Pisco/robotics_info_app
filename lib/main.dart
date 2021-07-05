import 'package:flutter/material.dart';
import 'package:robotics_community_app/ui/ui.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  runApp(MaterialApp(home: MyStatefulWidget(), debugShowCheckedModeBanner: false,));
}

