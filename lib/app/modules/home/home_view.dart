import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youapp_test_mobileapp/app/models/profile_model.dart';
import 'package:youapp_test_mobileapp/app/modules/home/widgets/about_card.dart';
import 'package:youapp_test_mobileapp/app/modules/home/widgets/about_controller.dart';
import 'package:youapp_test_mobileapp/app/theme/home_background_theme.dart';
import 'package:youapp_test_mobileapp/services/storage_service.dart';
import '../../models/user_model.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final AboutController aboutController = Get.find<AboutController>();
    final storage = Get.find<StorageService>();

    return HomeBackgroundTheme(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              storage.clearStorage();
              Get.offNamed('/login');
            },
            child: Wrap(
              runAlignment: WrapAlignment.center,
              children: [
                Icon(Icons.chevron_left, size: 20.0, weight: 2.0),
                Text('Back', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          title: Obx(() => Text(storage.user.value?.username ?? '-')),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Obx(() {
                      return Container(
                        decoration:
                            storage.profileImagePath.value == null
                                ? BoxDecoration(color: Color(0xFF000000))
                                : BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(
                                      storage.profileImage.value!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.0,
                            top: 154.0,
                            right: 16.0,
                            bottom: 16.0,
                          ),
                          child: Column(
                            spacing: 6.0,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() {
                                final username = storage.user.value?.username;
                                final birthday =
                                    storage.profile.value != null &&
                                            storage.profile.value?.birthday !=
                                                null
                                        ? DateTime.parse(
                                          storage.profile.value!.birthday!,
                                        )
                                        : DateTime.now();
                                return Text(
                                  '@$username, ${aboutController.calculateAge(birthday)}',
                                  style: Theme.of(context).textTheme.titleLarge,
                                );
                              }),
                              Obx(() {
                                final profile = storage.profile.value;
                                if (profile != null && profile.gender != null) {
                                  return Text(profile.gender!);
                                }
                                return SizedBox.shrink();
                              }),
                              Row(
                                spacing: 15,
                                children: [
                                  Obx(() {
                                    final profile = storage.profile.value;
                                    final birthday =
                                        profile != null &&
                                                profile.birthday != null
                                            ? profile.birthday
                                            : null;
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF1E221E),
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: 9.5,
                                          right: 16.0,
                                          bottom: 9.5,
                                          left: 16.0,
                                        ),
                                        child: Text(
                                          aboutController.getHoroscope(
                                            DateTime.parse(birthday!),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                  Obx(() {
                                    final profile = storage.profile.value;
                                    final birthday =
                                        profile != null &&
                                                profile.birthday != null
                                            ? profile.birthday
                                            : null;
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFF1E221E),
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: 9.5,
                                          right: 16.0,
                                          bottom: 9.5,
                                          left: 16.0,
                                        ),
                                        child: Text(
                                          aboutController.getZodiac(
                                            DateTime.parse(birthday!).year,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 16),
                AboutCard(),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Color(0xFF0E191F),
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 32, right: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Interest',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                IconButton(
                                  onPressed: () => Get.offNamed('/interests'),
                                  icon: Icon(Icons.edit_note),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          Padding(
                            padding: EdgeInsets.only(left: 32, right: 32),
                            child: Obx(() {
                              final profile = storage.profile.value;

                              if (profile != null &&
                                  profile.interests!.isNotEmpty) {
                                return Wrap(
                                  spacing: 12.0,
                                  children: [
                                    ...profile.interests!.map(
                                      (interest) => Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withAlpha(20),
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 9.5,
                                            right: 16.0,
                                            bottom: 9.5,
                                            left: 16.0,
                                          ),
                                          child: Text(interest),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Text(
                                  'Add in your interest to find a better match',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                );
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
