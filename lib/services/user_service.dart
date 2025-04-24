import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:youapp_test_mobileapp/app/providers/api_provider.dart';
import 'package:youapp_test_mobileapp/services/storage_service.dart';

class UserService {
  static Future<Map<String, dynamic>> createProfile(
    String name,
    String birthday,
    int height,
    int weight,
    List<String> interests,
  ) async {
    try {
      final storage = Get.find<StorageService>();
      final token = storage.token.value;
      final response = await ApiProvider.client.post(
        '/createProfile',
        data: {
          name: name,
          birthday: birthday,
          height: height,
          weight: weight,
          interests: interests,
        },
        options: Options(headers: {'x-access-token': token}),
      );
      print(response);

      return response.data;
    } catch (e) {
      throw Exception('Create profile failed: ${e.toString()}');
    }
  }

  static Future<Map<String, dynamic>> getProfile() async {
    try {
      final storage = Get.find<StorageService>();
      final token = storage.token.value;
      final response = await ApiProvider.client.get(
        '/getProfile',
        options: Options(headers: {'x-access-token': token}),
      );

      return response.data;
    } catch (e) {
      throw Exception('Get profile failed: ${e.toString()}');
    }
  }

  static Future<Map<String, dynamic>> updateProfile(
    String name,
    String birthday,
    Int height,
    Int weight,
    List<String> interests,
  ) async {
    try {
      final storage = Get.find<StorageService>();
      final token = storage.token.value;
      final response = await ApiProvider.client.put(
        '/updateProfile',
        data: {
          name: name,
          birthday: birthday,
          height: height,
          weight: weight,
          interests: interests,
        },
        options: Options(headers: {'x-access-token': token}),
      );

      return response.data;
    } catch (e) {
      throw Exception('Update profile failed: ${e.toString()}');
    }
  }
}
