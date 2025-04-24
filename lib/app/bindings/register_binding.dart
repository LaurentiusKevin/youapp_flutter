import 'package:get/get.dart';
import 'package:youapp_test_mobileapp/app/modules/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
  }
}
