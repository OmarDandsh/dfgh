import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterdelivery1/pages/signup.dart';
import '../admin/add_food.dart';
import '../admin/home_admin.dart';
import 'akudUser.dart';
import 'cheesBaka.dart';
import 'Categary.dart';
import 'home.dart';

import 'Flter.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late SignUp profile;
  late MenuView order;
  late MyContractsPage wallet;

  @override
  void initState() {
    homepage = Home();
    order = MenuView();
    profile = SignUp();
    wallet = MyContractsPage();
    pages = [homepage, order, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Colors.white,
          color: Color(0xFF030637),
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.list,
              color: Colors.white,
            ),
            Icon(
              Icons.assignment ,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outline,
              color: Colors.white,
            )
          ]),
      body: pages[currentTabIndex],
    );
  }
}
