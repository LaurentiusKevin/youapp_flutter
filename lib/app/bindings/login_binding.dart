import 'package:get/get.dart';
import 'package:youapp_test_mobileapp/app/modules/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  }
}
