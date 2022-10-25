import 'package:get/get.dart';
import '../controllers/controllerdrawer.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainDrawerController());
    
  }
}
