import 'package:ecommerce/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/pages/timepass.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primaryColor: Colors.red.shade900
  ),
  home: Login(),
));