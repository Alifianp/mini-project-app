import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:get/get.dart';


class landscape extends StatelessWidget {
      landscape({Key? key}) : super(key: key);


  final wd = Get.width;
  final hg = Get.height;

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: FadeInDown(
              delay: const Duration(milliseconds: 500),
              child: Text("Mohon ke mode portrait",
                  style: TextStyle(
                    fontWeight : FontWeight.w400,
                    fontSize: 33,
                  )),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: wd / 2,
                height: hg / 3,
                child: FadeInDown(
                    delay: const Duration(milliseconds: 1000),
                    child: Lottie.network(
                        "https://assets7.lottiefiles.com/packages/lf20_vkga8sgg.json",
                        animate: true)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
