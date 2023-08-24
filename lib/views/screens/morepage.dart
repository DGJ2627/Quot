import 'package:flutter/material.dart';

class morepage extends StatefulWidget {
  const morepage({super.key});

  @override
  State<morepage> createState() => _morepageState();
}

class _morepageState extends State<morepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 60,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Name:",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "gautamjethava160",
                  style: TextStyle(fontSize: 20),
                ),
              )),
          Text(""),
        ],
      ),
    );
  }
}
