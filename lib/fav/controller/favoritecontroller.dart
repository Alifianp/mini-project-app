import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../detail/model/listmodel.dart';

class listController extends GetxController {
  List<listmodel> hunt = [];

  void add({
    required id,
    required img,
    required judul,
    required jalan,
    required description,
    required isi,
    required fav,
    required share,
    

  }) {
    var contain = hunt.where((element) => element.id == id);
      if (contain.isEmpty) {
      hunt.add(listmodel(
          id: id,
          img: img,
          judul: judul,
          jalan: jalan,
          description: "",
          isi: "",
          fav: 0,
          share: 0,
          ));
        Get.snackbar("info", "favorite kamu",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 1600),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal);
      update();
    } else {
      Get.snackbar("peringatan", "sudah kamu favorite",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 1600),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal);
  }
}
}
