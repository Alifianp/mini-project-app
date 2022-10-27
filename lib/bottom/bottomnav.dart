import 'package:app_travel/fav/favorite.dart';
import 'package:app_travel/shared/shared.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../Home/home.dart';
import '../detail/detailinfo.dart';
import '../shared/landscape.dart';
import '../shared/shared.dart';
import 'bottomcontroller.dart';


class bottomnav extends StatelessWidget {
   bottomnav({Key? key}) : super(key: key);

  // Screens
  final List<Widget> screens = const [
    home(),
    favorite(),
  ];

  @override
  Widget build(BuildContext context) {
    /// Controller
    final _controller = Get.put(bottomcontroller());

      return SafeArea(
        child: Scaffold(
          /// Screens
          body: GetBuilder<bottomcontroller>(
              id: "ganti NavBar Index",
              builder: (context) {
                return screens[_controller.currentIndex];
              }),
          /// bottomNavigationBar
          bottomNavigationBar: GetBuilder<bottomcontroller>(
              id: "ganti NavBar Index",
              builder: (context) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(),
                  child: CustomNavigationBar(
                    iconSize: 30.0,
                    unSelectedColor: Colors.white,
                    strokeColor: Colors.white,
                    backgroundColor: Colors.teal,
                    selectedColor: Colors.black,
                    currentIndex: _controller.currentIndex,
                    onTap: (index) {
                      _controller.gantiNavBarIndex(index);
                    },
                    items: [
                      CustomNavigationBarItem(
                        icon: const Icon(
                          LineIcons.home,
                        ),
                      ),
                      CustomNavigationBarItem(
                        icon: const Icon(
                          LineIcons.search,
                        ),
                      ),
                      CustomNavigationBarItem(
                        icon: const Icon(
                          Icons.favorite_border,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      );

  }
}
