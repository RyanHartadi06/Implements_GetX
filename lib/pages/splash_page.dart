import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_slicing/theme.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Get.offNamed('/login'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 71,
              height: 91.46,
              decoration: const BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/logo.png'))),
            ),
            SizedBox(
              width: 24,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FIND \n JOB",
                  style: whiteTextStyle.copyWith(fontSize: 42),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
