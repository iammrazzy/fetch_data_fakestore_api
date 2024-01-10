import 'package:e_shop/view/pro_cart.dart';
import 'package:e_shop/view/pro_fav.dart';
import 'package:e_shop/view/pro_home.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // list all screen
  List<dynamic> screens = [
    const ProductHome(),
    const ProductFavorite(),
    const ProductCart(),
  ];

  // default index
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 25.0,
        selectedLabelStyle: GoogleFonts.kantumruyPro(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: GoogleFonts.kantumruyPro(
          fontSize: 15.0,
        ),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: 'favorite'.tr,
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -10, end: -12),
              // showBadge: allDatas.isEmpty ? false : true,
              badgeContent: Text(
                '0',
                style: GoogleFonts.kantumruyPro(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: Colors.pink,
                padding: const EdgeInsets.all(5),
                borderRadius: BorderRadius.circular(4),
                elevation: 0,
              ),
              child: const Icon(
                Icons.shopping_cart,
              ),
            ),
            label: 'cart'.tr,
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
