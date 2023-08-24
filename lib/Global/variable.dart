import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

double H = Get.height;
double W = Get.width;

Color selectedColor = Colors.black;
Color BackgroundColor = Colors.white;
String Imagepath = "assets/image/back1.jpg";
double FontSize = 16;

GlobalKey <FormState> LoginPage_key = GlobalKey<FormState>();
TextEditingController Login_email_controller = TextEditingController();
TextEditingController Login_password_controller = TextEditingController();
String? Login_email;
String Login_password = "*******************";