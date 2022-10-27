import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../Home/home.dart';
import '../fav/controller/favoritecontroller.dart';
import 'controller/switchcontroller.dart';
import 'controller/travcrontoller.dart';

final w = Get.width;
final h = Get.height;

class detailinfo extends StatelessWidget {
  const detailinfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(switchcontroller());

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          backgroundColor: Color(0xFF136673),
          body: Container(
            child: Column(
              children: [
                TopImage(),
                SingleChildScrollView(
                  child: Container(
                    height: 300,
                    width: 400,
                    child: Column(
                      children: [
                        judul(),
                        jalan(),
                        stars(),
                        description(),
                        isi(),
                        MyFAB(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class TopImage extends StatelessWidget {
  const TopImage({
    Key? key,
  }) : super(key: key);
  Size get preferredSize => const Size.fromHeight(55);
  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(switchcontroller());
    return FadeInDown(
      delay: const Duration(milliseconds: 1800),
      child: Container(
        height: 300,
        width: 400,
        child: Hero(
            tag:
                Get.put(travcontroller()).hunt[_controller.currenthuntIndex].id,
            child: Image.asset(
                fit: BoxFit.fill,
                Get.put(travcontroller())
                    .hunt[_controller.currenthuntIndex]
                    .img)),
      ),
    );
  }
}

class judul extends StatelessWidget {
  const judul({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(switchcontroller());
    return FadeInDown(
      delay: const Duration(milliseconds: 900),
      child: Container(
        margin: const EdgeInsets.only(left: 15, top: 10),
        child: Row(
          children: [
            Container(
                child: Text(
              Get.put(travcontroller())
                  .hunt[_controller.currenthuntIndex]
                  .judul,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
}

class jalan extends StatelessWidget {
  const jalan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(switchcontroller());
    return FadeInDown(
      delay: const Duration(milliseconds: 1100),
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            SizedBox(
              width: 13,
            ),
            Icon(
              Icons.location_pin,
              color: Colors.white,
            ),
            Text(
              Get.put(travcontroller())
                  .hunt[_controller.currenthuntIndex]
                  .jalan,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class stars extends StatelessWidget {
  const stars({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
          height: 20,
        ),
        IconTheme(
          data: IconThemeData(
            size: 25,
          ),
          child: Starsicon(
            value: 3,
            diisi: Icon(Icons.star, color: Colors.yellow),
            belumdiisi: Icon(Icons.star, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class description extends StatelessWidget {
  const description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(switchcontroller());
    return FadeInDown(
      delay: const Duration(milliseconds: 900),
      child: Container(
        margin: const EdgeInsets.only(left: 15, top: 5),
        child: Row(
          children: [
            SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Text(
                  Get.put(travcontroller())
                      .hunt[_controller.currenthuntIndex]
                      .description,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}

class isi extends StatelessWidget {
  const isi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(switchcontroller());
    return FadeInDown(
      delay: const Duration(milliseconds: 900),
      child: Container(
        margin: const EdgeInsets.only(left: 15, top: 5),
        child: Row(
          children: [
            SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  width: 340,
                  child: Text(
                    Get.put(travcontroller())
                        .hunt[_controller.currenthuntIndex]
                        .isi,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class MyFAB extends StatelessWidget {
  const MyFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var huntController = Get.put(listController());
    var controller = Get.put(switchcontroller());
    return Row(
      children: [
        IconButton(
          icon: new Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            Get.put(listController()).add(
              id: huntController.hunt[controller.currenthuntIndex].id,
              img: huntController.hunt[controller.currenthuntIndex].img,
              judul: huntController.hunt[controller.currenthuntIndex].judul,
              jalan: huntController.hunt[controller.currenthuntIndex].jalan,
              description:
                  huntController.hunt[controller.currenthuntIndex].description,
              isi: huntController.hunt[controller.currenthuntIndex].isi,
              fav: huntController.hunt[controller.currenthuntIndex].fav,
              share: huntController.hunt[controller.currenthuntIndex].share,
            );
          },
        ),
        Text('100',style:(TextStyle(color: Colors.white))),
                SizedBox(width: 50,),
        IconButton(
          icon: new Icon(
            Icons.share,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {},
        ),

        Text('250',style:(TextStyle(color: Colors.white))),
      ],
    );
  }
}
