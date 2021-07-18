import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:robotics_app/ui/ui.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  runApp(MaterialApp(home: MyStatefulWidget(), debugShowCheckedModeBanner: false,));
}

