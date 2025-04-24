import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youapp_test_mobileapp/app/routes/app_pages.dart';
import 'package:youapp_test_mobileapp/app/theme/theme.dart';
import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storageService = await StorageService().init();
  Get.put(storageService);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = Get.find<StorageService>();
    final token = storage.token.value;

    return GetMaterialApp(
      title: 'Technical Test Laurent',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: token == null ? AppPages.initialPage : '/home',
      getPages: AppPages.routes,
    );
  }
}
