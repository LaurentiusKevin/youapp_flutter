import 'package:get/get.dart';
import 'package:youapp_test_mobileapp/app/bindings/home_binding.dart';
import 'package:youapp_test_mobileapp/app/bindings/interests_binding.dart';
import 'package:youapp_test_mobileapp/app/bindings/login_binding.dart';
import 'package:youapp_test_mobileapp/app/bindings/register_binding.dart';
import 'package:youapp_test_mobileapp/app/modules/home/home_view.dart';
import 'package:youapp_test_mobileapp/app/modules/interests/interests_view.dart';
import 'package:youapp_test_mobileapp/app/modules/login/login_view.dart';
import 'package:youapp_test_mobileapp/app/modules/register/register_view.dart';

class AppPages {
  static const initialPage = '/login';

  static final routes = [
    GetPage(name: '/login', page: () => LoginView(), binding: LoginBinding()),
    GetPage(
      name: '/register',
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(name: '/home', page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: '/interests',
      page: () => InterestsView(),
      binding: InterestsBinding(),
    ),
  ];
}
