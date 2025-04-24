import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:youapp_test_mobileapp/services/storage_service.dart';

import '../../../services/user_service.dart';

class InterestsController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final storage = Get.find<StorageService>();
  final List<String> interests = [];
  final isLoading = false.obs;
  final isPasswordHidden = true.obs;

  @override
  void onInit() {
    super.onInit();
    if (storage.profile.value != null &&
        storage.profile.value!.interests!.isNotEmpty) {
      setInterests(storage.profile.value!.interests!);
    }
    Future.delayed(Duration.zero, () {
      formKey.currentState?.reset();
    });
  }

  void setInterests(List<String> data) {
    interests.assignAll(data);
  }

  void updateInterests() async {
    final profile = storage.profile.value;
    final Map<String, dynamic> updatedProfile = {
      'name': profile?.name!,
      'gender': profile?.gender!,
      'birthday': profile?.birthday!,
      'height': profile?.height!,
      'weight': profile?.weight!,
      'interests': interests,
    };
    storage.saveProfile(updatedProfile);

    try {
      await UserService.createProfile(
        profile!.name!,
        profile.birthday!,
        profile.height!,
        profile.weight!,
        interests,
      );
    } catch (e) {
      Get.snackbar('API Error (Data is stored locally)', e.toString());
    } finally {
      isLoading.value = false;
      Get.offNamed('/home');
    }
  }
}
