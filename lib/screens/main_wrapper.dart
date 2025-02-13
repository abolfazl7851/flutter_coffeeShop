
import 'package:coffee_shop/screens/notification_screen.dart';
import 'package:coffee_shop/screens/profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../CoffeeShopFeature/presentation/screens/home_screen.dart';
import '../CoffeeShopFeature/presentation/screens/signup_screen.dart';


class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final PageController _myPage = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Coffee Shop",
            style: GoogleFonts.pacifico(fontSize: 27, color: Colors.black,fontWeight: FontWeight.w500)),
        centerTitle: true,
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.sort_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 5),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.person, size: 32, color: Colors.white),
          Icon(Icons.coffee_rounded, size: 32, color: Colors.white),
          Icon(Icons.settings, size: 32, color: Colors.white),
        ],
        // color: const Color(0xFF212325),
        color: Colors.orange,
        buttonBackgroundColor: Colors.orange,
        backgroundColor: const Color(0xFF212325),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _myPage.jumpToPage(index);
          });
        },
        letIndexChange: (index) => true,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _myPage,
        children: const [
          SignUpScreen(),
          HomeScreen(),
          NotificationScreen(),
          // SettingsPage(),
        ],
      ),
    );
  }
}
