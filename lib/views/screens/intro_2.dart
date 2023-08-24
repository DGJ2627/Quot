import 'package:flutter/material.dart';
import 'package:get/get.dart';

class intro_2 extends StatefulWidget {
  const intro_2({super.key});

  @override
  State<intro_2> createState() => _intro_2State();
}

class _intro_2State extends State<intro_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          Get.toNamed('/login_page');
        },
        child: const Icon(
          Icons.navigate_next,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/image/intro2.jpg",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
