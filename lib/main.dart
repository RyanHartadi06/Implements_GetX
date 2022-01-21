import 'package:flutter/material.dart';
import 'package:latihan_slicing/pages/splash_page.dart';
import 'package:get/get.dart';
import 'package:latihan_slicing/route/app_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Find Job',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      getPages: AppPage.pages,
    );
  }
}
