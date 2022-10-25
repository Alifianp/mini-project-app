import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class DrawerItemModel {
  IconData icon;
  String title;
  //
  DrawerItemModel({
    required this.icon,
    required this.title,
  });
}
List<DrawerItemModel> drawerItem = [
    DrawerItemModel(icon: LineIcons.alternateSignIn, title: "Sign Out"),
];