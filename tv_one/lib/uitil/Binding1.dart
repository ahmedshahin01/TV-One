
import 'package:get/get.dart';
import 'package:tv_one/controller/showController.dart';

class Binding1 extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ShowController());
    
    }

}