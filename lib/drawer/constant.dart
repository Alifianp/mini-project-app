import 'package:app_travel/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../page/page.dart';
import 'controllers/controllerdrawer.dart';
import 'model/modeldrawer.dart';


final w = Get.width;
final h = Get.height;

const Color unSelectedColor = Color.fromARGB(255, 234, 234, 234);

Drawer mainDrawer(int index) {
  var controller = Get.put(MainDrawerController());
  controller.changeIndex(index); 
  return Drawer(
    child: Column(
      children: [
        GetBuilder<MainDrawerController>(
            id: "current Drawer Item Index",
            builder: (context) {
              return Container(
                  margin: const EdgeInsets.all(20),
                  width: w,
                  height: h / 1.75,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: drawerItem.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.changeIndex(index);
                              Navigator.pop(context);
                              Future.delayed(const Duration(milliseconds: 300),
                                  () {
                                  return showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                        "Penting",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const <Widget>[
                                            Text(
                                                'Apakah mau logout? ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromARGB(
                                                        255, 134, 134, 134))),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                            child: const Text(
                                              'tidak',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 109, 109, 109)),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                        TextButton(
                                            child: const Text(
                                              'iya',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onPressed: (){}
                                            ),
                                      ],
                                    );
                                  },
                                );
                              });
                        },
                        child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            tileColor:
                                controller.currentDrawerItmeIndex == index
                                    ? Color.fromARGB(255, 166, 166, 163)
                                    : Colors.transparent,
                            leading: Icon(
                              drawerItem[index].icon,
                              color: controller.currentDrawerItmeIndex == index
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                            title: Text(
                              drawerItem[index].title,
                              style: TextStyle(
                                color:
                                    controller.currentDrawerItmeIndex == index
                                        ? Colors.black
                                        : Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      if (index == 6) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ));
            }),
      ],
    ),
  );
}
