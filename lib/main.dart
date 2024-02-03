import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sort_api/screen/view/charts_screen.dart';
import 'package:sort_api/screen/view/home_screen.dart';
import 'package:sort_api/screen/view/other.dart';
import 'package:sort_api/screen/view/tabScreen.dart';

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, routes: {
    "/": (p0) => TabScreen(),
  }));
}
