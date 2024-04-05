import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/view/home_page.dart';

void main() {
  runApp(GetMaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}