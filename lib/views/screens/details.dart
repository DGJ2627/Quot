import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

import '../../Global/variable.dart';
import '../../Model/qutoes_model.dart';

class details_page extends StatefulWidget {
  const details_page({super.key});

  @override
  State<details_page> createState() => _details_pageState();
}

class _details_pageState extends State<details_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Love",
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("lib/json/json_Data.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String data = snapshot.data!;
            Map decodedData = jsonDecode(data);
            List QutoesList = decodedData['quotes'];

            List<Qutoes_model> Qutoe =
                QutoesList.map((e) => Qutoes_model.fromMap(data: e)).toList();

            return Center(
              child: ListView.builder(
                itemCount: Qutoe.length,
                itemBuilder: (context, i) {
                  return Center(
                    child: Column(
                      children: [
                        ListTile(
                            leading: CircleAvatar(
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  WavyAnimatedText("${Qutoe[i].id}",
                                      textStyle:
                                          const TextStyle(color: Colors.black)),
                                  WavyAnimatedText("${Qutoe[i].id}",
                                      textStyle:
                                          const TextStyle(color: Colors.black)),
                                  WavyAnimatedText("${Qutoe[i].id}",
                                      textStyle:
                                          const TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                            title: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                RotateAnimatedText(
                                  Qutoe[i].quote,
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  duration: const Duration(seconds: 10),
                                ),
                                RotateAnimatedText(
                                  Qutoe[i].quote,
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  duration: const Duration(seconds: 10),
                                ),
                                RotateAnimatedText(
                                  Qutoe[i].quote,
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  duration: const Duration(seconds: 10),
                                ),
                              ],
                            ),
                            subtitle: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                ScaleAnimatedText(
                                  "Author ~ ${Qutoe[i].author}",
                                  textStyle: const TextStyle(fontSize: 16),
                                ),
                                ScaleAnimatedText(
                                  "Author ~ ${Qutoe[i].author}",
                                  textStyle: const TextStyle(fontSize: 16),
                                ),
                                ScaleAnimatedText(
                                  "Author ~ ${Qutoe[i].author}",
                                  textStyle: const TextStyle(fontSize: 16),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: H * 0.05,
                          width: W * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const LikeButton(
                                size: 20,
                              ),
                              IconButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    const ClipboardData(
                                      text: 'Qutoe',
                                    ),
                                  ).then(
                                    (value) => Get.snackbar(
                                      "Quote",
                                      "Successfully Copy",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.5),
                                      duration: const Duration(seconds: 3),
                                      animationDuration:
                                          const Duration(seconds: 1),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.copy),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.snackbar(
                                    'Quote',
                                    "Download SuccessFul",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.5),
                                    duration: const Duration(seconds: 3),
                                    animationDuration:
                                        const Duration(seconds: 1),
                                  );
                                },
                                icon: const Icon(Icons.download),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.toNamed('/Editingpage',
                                      arguments: Qutoe[i].quote);
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
