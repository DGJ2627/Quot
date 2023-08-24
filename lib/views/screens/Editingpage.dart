import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/Global/Listcolor.dart';
import 'package:share_extend/share_extend.dart';
import '../../Global/backgroundList.dart';
import '../../Global/variable.dart';

class Editingpage extends StatefulWidget {
  const Editingpage({super.key});

  @override
  State<Editingpage> createState() => _EditingpageState();
}

class _EditingpageState extends State<Editingpage> {
  final keyBoundary = GlobalKey();
  ShareImage() async {
    RenderRepaintBoundary rawData = await keyBoundary.currentContext!
        .findRenderObject() as RenderRepaintBoundary;

    var image = await rawData.toImage(pixelRatio: 5);

    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);

    Uint8List uint8list = await byteData!.buffer.asUint8List();

    Directory directory = await getApplicationSupportDirectory();

    File file = await File("${directory.path}.png");
    await file.writeAsBytes(uint8list);

    ShareExtend.share(file.path, "image");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: RepaintBoundary(
                key: keyBoundary,
                child: Container(
                  alignment: Alignment.center,
                  height: H * 0.3,
                  width: W * 0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("${Imagepath}"), fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Life isn’t about getting and having, it’s about giving and being.",
                      style: TextStyle(fontSize: FontSize, color: selectedColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {
                setState(() {
                  ShareImage();
                });
              },
              icon: const Icon(Icons.share_outlined),
            ),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Text Color",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1),
              scrollDirection: Axis.horizontal,
              itemCount: containerColor.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = containerColor[i];
                      setState(() {});
                    });
                  },
                  child: Container(
                    height: H * 0.02,
                    width: W * 0.02,
                    color: containerColor[i],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Back Ground",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, crossAxisSpacing: 10, mainAxisSpacing: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      Imagepath = BackgroundList[index];
                      setState(() {});
                    });
                  },
                  child: Container(
                    height: H * 0.08,
                    width: W * 0.08,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("${BackgroundList[index]}"),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
