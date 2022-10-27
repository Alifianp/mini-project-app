import 'package:animate_do/animate_do.dart';
import 'package:app_travel/fav/controller/favoritecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';

import '../drawer/constant.dart';



class favorite extends StatelessWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        drawer: mainDrawer(0),
        body: const Padding(
          padding: EdgeInsets.all(10.0),
          child: MainItem(),
        ),
      ),
    );
  }
}

class MainItem extends StatelessWidget {
  const MainItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var FavoriteController =  Get.put(listController());
    return Column(
      children: [
        GetBuilder<listController>(builder: (context) {
          return FavoriteController.hunt.isEmpty
              ? Expanded(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: w / 1.01,
                      height: h / 4,
                      child: FadeInUp(
                        delay: const Duration(milliseconds: 300),
                        child: Lottie.network(
                            "https://assets8.lottiefiles.com/packages/lf20_ZZ7nur.json",
                            animate: true),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 600),
                      child: Text(
                        "Tidak ada Favorite!",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    )
                  ],
                ))
              : SizedBox(
                  width: w,
                  height: h / 1.3,
                  child: Column(
                    children: [
                      SizedBox(
                        width: w,
                        height: h / 1.65,
                        child: ListView.builder(
                          itemCount: FavoriteController.hunt.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(5.0),
                              width: w,
                              height: h / 4.5,
                              child: Stack(children: [
                                Positioned(
                                  bottom: 10,
                                  right: 0,
                                  child: FadeInLeft(
                                    delay: Duration(
                                        milliseconds: (index / 0.5 * 100).toInt()),
                                    child: Container(
                                      width: w / 1.3,
                                      height: h / 5.5,
                                      decoration: BoxDecoration(
                                          color: unSelectedColor,
                                          borderRadius: BorderRadius.circular(100),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 221, 219, 219),
                                                spreadRadius: 3,
                                                blurRadius: 10,
                                                offset: Offset(-7, 11))
                                          ]),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 3,
                                  child: FadeInLeft(
                                    delay: Duration(
                                        milliseconds: (index / 0.5 * 200).toInt()),
                                    child: Spin(
                                      delay: Duration(
                                          milliseconds:
                                              (index / 0.5 * 250).toInt()),
                                      child: SizedBox(
                                        width: w / 2.5,
                                        height: h / 5,
                                        child: Hero(
                                          tag: FavoriteController
                                              .hunt[index].id,
                                          child: Image.asset(
                                            FavoriteController.hunt[index].img,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 170,
                                  top: 40,
                                  child: FadeInLeft(
                                    delay: Duration(
                                        milliseconds: (index / 0.5 * 300).toInt()),
                                    child: Text(
                                      FavoriteController.hunt[index].judul,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 171,
                                  top: 68,
                                  child: FadeInLeft(
                                    delay: Duration(
                                        milliseconds: (index / 0.5 * 400).toInt()),
                                    child: Text(
                                      FavoriteController.hunt[index].judul,
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 135, 134, 134),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ],
    );
  }
}



