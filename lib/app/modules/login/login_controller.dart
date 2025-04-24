import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:youapp_test_mobileapp/services/auth_service.dart';
import 'package:youapp_test_mobileapp/services/user_service.dart';

import '../../../services/storage_service.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final storage = Get.find<StorageService>();
  final isLoading = false.obs;
  final isPasswordHidden = true.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      formKey.currentState?.reset();
    });
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void login() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final formData = formKey.currentState!.value;

      isLoading.value = true;
      try {
        final response = await AuthService.login(
          formData['email'],
          formData['email'],
          formData['password'],
        );
        if (response['message'] != 'User has been logged in successfully') {
          Get.snackbar('Invalid', response['message']);
          return;
        }

        final token = response['access_token'];
        storage.saveToken(token);

        final userResponse = await UserService.getProfile();
        storage.saveUser(userResponse['data']);

        Get.snackbar('Welcome back', response['message']);
        Get.offNamed('/home');
      } catch (e) {
        Get.snackbar('Error', e.toString());
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar('Invalid', 'Please fill all fields correctly');
    }
  }
}
