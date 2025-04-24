import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youapp_test_mobileapp/app/models/profile_model.dart';
import 'package:youapp_test_mobileapp/app/modules/home/widgets/about_form.dart';
import 'package:youapp_test_mobileapp/services/storage_service.dart';

import 'about_controller.dart';

class AboutCard extends StatelessWidget {
  AboutCard({super.key});

  final AboutController controller = Get.put(AboutController());

  @override
  Widget build(BuildContext context) {
    final storage = Get.find<StorageService>();
    final textInfoStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Colors.white.withValues(alpha: 0.3),
    );
    final textValueStyle = Theme.of(context).textTheme.bodyMedium;

    return Obx(() {
      final profile = storage.profile.value;
      return SizedBox(
        width: double.infinity,
        child: Card(
          color: Color(0xFF0E191F),
          child: Padding(
            padding: EdgeInsets.only(
              top: 18.0,
              bottom: 23.0,
              left: 27.0,
              right: 14.0,
            ),
            child:
                !controller.isEditing.value
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'About',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            IconButton(
                              onPressed: controller.toggleEditing,
                              icon: Icon(Icons.edit_note),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        profile == null
                            ? Text(
                              'Add in your your to help others know you better',
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                            : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Birthday: ',
                                        style: textInfoStyle,
                                      ),
                                      TextSpan(
                                        text:
                                            '${DateFormat('dd / MM / yyyy').format(DateTime.parse(profile.birthday!))} (Age ${controller.calculateAge(DateTime.parse(profile.birthday!))})',
                                        style: textValueStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Horoscope: ',
                                        style: textInfoStyle,
                                      ),
                                      TextSpan(
                                        text: controller.getHoroscope(
                                          DateTime.parse(profile.birthday!),
                                        ),
                                        style: textValueStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Zodiac: ',
                                        style: textInfoStyle,
                                      ),
                                      TextSpan(
                                        text: controller.getZodiac(
                                          DateTime.parse(
                                            profile.birthday!,
                                          ).year,
                                        ),
                                        style: textValueStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Height: ',
                                        style: textInfoStyle,
                                      ),
                                      TextSpan(
                                        text: '${profile.height} cm',
                                        style: textValueStyle,
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Weight: ',
                                        style: textInfoStyle,
                                      ),
                                      TextSpan(
                                        text: '${profile.weight} kg',
                                        style: textValueStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                      ],
                    )
                    : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'About',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            TextButton(
                              onPressed: controller.updateProfile,
                              child:
                                  controller.isLoading.value
                                      ? CircularProgressIndicator(
                                        strokeWidth: 2,
                                      )
                                      : Text(
                                        'Save & Update',
                                        style: TextStyle(
                                          color: Color(0xFFD5BE88),
                                        ),
                                      ),
                            ),
                          ],
                        ),
                        SizedBox(height: 31),
                        AboutForm(),
                      ],
                    ),
          ),
        ),
      );
    });
  }
}
