import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/order.dart';
import 'package:ecommerce/pages/profile.dart';
import 'package:flutter/material.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  late List<Widget> pages;
  late home Homepage;
  late Order order;
  late Profile profile;
  int currentTabindex = 0;

  @override
  void initState() {
    Homepage = home();
    order = Order();
    profile = Profile();
    pages = [Homepage, order, profile];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Color(0xfff2f2f2),
          color: Colors.black,
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabindex = index;
            });
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outlined,
              color: Colors.white,
            )
          ]),
      body: pages[currentTabindex],
    );
  }
}
