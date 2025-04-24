import 'package:get/get.dart';
import 'package:youapp_test_mobileapp/app/modules/interests/interests_controller.dart';

class InterestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InterestsController>(() => InterestsController(), fenix: true);
  }
}
