import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes_app/Global/categoryList.dart';
import 'package:get/get.dart';

import '../../Global/variable.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: CategoryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10),
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('details_page');
              },
              child: Container(
                color: Colors.primaries[i],
                alignment: Alignment.center,
                height: H * 0.05,
                width: W * 0.2,
                child: Text(
                  "${CategoryList[i]}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
