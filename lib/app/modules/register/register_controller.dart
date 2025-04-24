import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:youapp_test_mobileapp/services/auth_service.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
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

  void register() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final formData = formKey.currentState!.value;

      isLoading.value = true;
      try {
        final response = await AuthService.register(
          formData['email'],
          formData['email'],
          formData['password'],
        );

        if (response['message'] != 'User has been created successfully') {
          Get.snackbar('Invalid', response['message']);
          return;
        }

        Get.offNamed('/login');
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
