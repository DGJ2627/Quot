import 'package:flutter/material.dart';

class likepage extends StatefulWidget {
  const likepage({super.key});

  @override
  State<likepage> createState() => _likepageState();
}

class _likepageState extends State<likepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          // SizedBox(
          //   height: 0,
          // ),
          Align(
            alignment: Alignment.center,
            child: Text("Favourite Quotes",style: TextStyle(fontSize: 30,),),
          ),
        ],
      ),
    );
  }
}
