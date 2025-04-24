import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:youapp_test_mobileapp/services/storage_service.dart';
import 'package:youapp_test_mobileapp/services/user_service.dart';

class AboutController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final storage = Get.find<StorageService>();
  var isEditing = false.obs;
  var isLoading = false.obs;
  var aboutText = 'Hello! I love Flutter.'.obs;
  final Rx<File?> imageFile = Rx<File?>(null);

  void toggleEditing() {
    if (isEditing.value == true) {
      formKey.currentState?.reset();
    } else {
      final profile = storage.profile.value;
      imageFile.value = storage.profileImage.value;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        formKey.currentState?.patchValue({
          'name': profile?.name,
          'gender': profile?.gender,
          'birthday': profile?.birthday != null
              ? DateTime.tryParse(profile!.birthday!)
              : null,
          'height': profile?.height?.toString(),
          'weight': profile?.weight?.toString(),
          'interests': profile?.interests ?? [],
        });
      });
    }

    isEditing.toggle();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );

    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  String getHoroscope(DateTime date) {
    final day = date.day;
    final month = date.month;

    if ((month == 1 && day >= 20) || (month == 2 && day <= 18))
      return 'Aquarius';
    if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) return 'Pisces';
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) return 'Aries';
    if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) return 'Taurus';
    if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) return 'Gemini';
    if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) return 'Cancer';
    if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) return 'Leo';
    if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) return 'Virgo';
    if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) return 'Libra';
    if ((month == 10 && day >= 23) || (month == 11 && day <= 21))
      return 'Scorpio';
    if ((month == 11 && day >= 22) || (month == 12 && day <= 21))
      return 'Sagittarius';
    return 'Capricorn';
  }

  String getZodiac(int year) {
    const zodiacList = [
      'Rat',
      'Ox',
      'Tiger',
      'Rabbit',
      'Dragon',
      'Snake',
      'Horse',
      'Goat',
      'Monkey',
      'Rooster',
      'Dog',
      'Pig',
    ];

    // 1995 is my birth year
    // so I set it as the base year and it is Pig (11)
    int baseYear = 1995;
    int baseIndex = zodiacList.indexOf('Pig');

    int index = (year - baseYear + baseIndex) % 12;
    if (index < 0) index += 12;

    return zodiacList[index];
  }

  void setZodiacAndHoroscope(DateTime date) {
    final String horoscope = getHoroscope(date);
    final String zodiac = getZodiac(date.year);

    formKey.currentState?.fields['horoscope']?.didChange(horoscope);
    formKey.currentState?.fields['zodiac']?.didChange(zodiac);
  }

  void updateProfile() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final formData = formKey.currentState!.value;
      isLoading.value = true;

      final Map<String, dynamic> profile = {
        'name': formData['name'],
        'gender': formData['gender'],
        'birthday': DateFormat('yyyy-MM-dd').format(formData['birthday']),
        'height': int.parse(formData['height']),
        'weight': int.parse(formData['weight']),
        'interests':
            (formData['interests'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [],
      };
      storage.saveProfile(profile);

      try {
        await UserService.createProfile(
          profile['name'],
          profile['birthday'],
          profile['height'],
          profile['weight'],
          profile['interests'],
        );
      } catch (e) {
        Get.snackbar(
          'Error (value stored locally)',
          e.toString(),
          duration: Duration(seconds: 8),
          backgroundColor: Color(0xFFE67171),
        );
      }

      if (imageFile.value != null) {
        storage.saveProfileImagePath(imageFile.value!.path);
        imageFile.value = null;
      }

      isLoading.value = false;
      toggleEditing();
    } else {
      Get.snackbar('Invalid', 'Please fill all fields correctly');
    }
  }

  int calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }
}
