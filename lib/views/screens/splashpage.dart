import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splashpage extends StatefulWidget {
  const splashpage({super.key});

  @override
  State<splashpage> createState() => _splashpageState();
}

class _splashpageState extends State<splashpage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 15),
          () {
        Get.toNamed('intro_screen');
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/image/splashImage.jpg"),
      ),
    );
  }
}
