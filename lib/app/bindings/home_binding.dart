import 'package:get/get.dart';
import 'package:youapp_test_mobileapp/app/modules/home/home_controller.dart';
import 'package:youapp_test_mobileapp/app/modules/home/widgets/about_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<AboutController>(() => AboutController(), fenix: true);
  }
}
