import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:quotes_app/views/screens/Homepage.dart';
import 'package:quotes_app/views/screens/likepage.dart';
import 'package:quotes_app/views/screens/morepage.dart';
import 'package:quotes_app/views/screens/search.dart';

class deshboard extends StatefulWidget {
  const deshboard({super.key});

  @override
  State<deshboard> createState() => _deshboardState();
}

class _deshboardState extends State<deshboard> {
  PageController pageController = PageController();
  int PageI = 0;
  List<Widget> Pages = [
    const Homepage(),
    const likepage(),
    const searchpage(),
    const morepage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes App"),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GNav(
          gap: 8,
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade500,
          padding: const EdgeInsets.all(16),
          onTabChange: (val) {
            setState(() {
              PageI = val;
              pageController.animateToPage(PageI,
                  duration: const Duration(microseconds: 500),
                  curve: Curves.linear);
            });
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.favorite_border,
              text: "Like",
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
            ),
            GButton(
              icon: Icons.more_horiz,
              text: "More",
            ),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (val) {
          setState(() {
            PageI = val;
            pageController.animateToPage(
              PageI,
              duration: const Duration(microseconds: 200),
              curve: Curves.linear,
            );
          });
        },
        children: Pages,
      ),
    );
  }
}
