import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:quotes_app/views/screens/Editingpage.dart';
import 'package:quotes_app/views/screens/Homepage.dart';
import 'package:quotes_app/views/screens/deshboard.dart';
import 'package:quotes_app/views/screens/details.dart';
import 'package:quotes_app/views/screens/intro_2.dart';
import 'package:quotes_app/views/screens/intro_screen.dart';
import 'package:quotes_app/views/screens/likepage.dart';
import 'package:quotes_app/views/screens/login_page.dart';
import 'package:quotes_app/views/screens/morepage.dart';
import 'package:quotes_app/views/screens/search.dart';
import 'package:quotes_app/views/screens/splashpage.dart';

void main() {
  runApp(
    const Gautam(),
  );
}

class Gautam extends StatelessWidget {
  const Gautam({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        colorScheme: ColorScheme.light(
          primary: const Color(0xff37474f),
          secondary: Colors.grey.shade200,
        ),
      ),
      darkTheme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark,
          primary: Colors.deepPurpleAccent,
          secondary: Colors.white54,
        ),
      ),
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(
          name: '/',
          page: () => const splashpage(),
        ),
        GetPage(
          name: '/intro_screen',
          page: () => const intro_screen(),
        ),
        GetPage(
          name: '/intro_2',
          page: () => const intro_2(),
        ),
        GetPage(
          name: '/login_page',
          page: () => const login_page(),
        ),
        GetPage(
          name: '/deshboard',
          page: () => const deshboard(),
        ),
        GetPage(
          name: '/home',
          page: () => const Homepage(),
        ),
        GetPage(
          name: '/details_page',
          page: () => const details_page(),
        ),
        GetPage(
          name: '/searchpage',
          page: () => const searchpage(),
        ),
        GetPage(
          name: '/likepage',
          page: () => const likepage(),
        ),
        GetPage(
          name: '/morepage',
          page: () => const morepage(),
        ),
        GetPage(
          name: '/Editingpage',
          page: () => const Editingpage(),
        ),
      ],
    );
  }
}
