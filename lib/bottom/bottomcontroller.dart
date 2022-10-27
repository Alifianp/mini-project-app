import 'package:get/get.dart';

class bottomcontroller extends GetxController {
  var currentIndex = 0;

  void gantiNavBarIndex(int index){
    currentIndex = index;
    update(["ganti NavBar Index"]);

  }
}
