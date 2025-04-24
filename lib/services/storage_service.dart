import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/models/profile_model.dart';
import '../app/models/user_model.dart';

class StorageService extends GetxService {
  late SharedPreferences _prefs;

  final RxnString token = RxnString();
  final Rxn<UserModel> user = Rxn<UserModel>();
  final Rxn<ProfileModel> profile = Rxn<ProfileModel>();
  final RxnString profileImagePath = RxnString();
  final Rxn<File> profileImage = Rxn<File>();

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    token.value = _prefs.getString('access_token');

    final userString = _prefs.getString('user');
    if (userString != null) {
      user.value = UserModel.fromJson(json.decode(userString));
    }

    final profileString = _prefs.getString('profile');
    if (profileString != null) {
      profile.value = ProfileModel.fromJson(json.decode(profileString));
    }

    final profileImageString = _prefs.getString('profile_image_path');
    profileImagePath.value = profileImageString;
    if (profileImageString != null) {
      profileImage.value = File(profileImageString);
    }
    return this;
  }

  Future<void> saveToken(String accessToken) async {
    await _prefs.setString('access_token', accessToken);
    token.value = accessToken;
  }

  Future<void> saveUser(Map<String, dynamic> userData) async {
    await _prefs.setString('user', json.encode(userData));
    user.value = UserModel.fromJson(userData);
  }

  Future<void> saveProfile(Map<String, dynamic> profileData) async {
    await _prefs.setString('profile', json.encode(profileData));
    profile.value = ProfileModel.fromJson(profileData);
  }

  Future<void> saveProfileImagePath(String imagePath) async {
    await _prefs.setString('profile_image_path', imagePath);
    profileImage.value = File(imagePath);
  }

  Future<void> clearStorage() async {
    await _prefs.clear();
  }
}
