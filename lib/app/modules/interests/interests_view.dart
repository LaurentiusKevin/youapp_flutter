import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:youapp_test_mobileapp/app/modules/interests/widgets/editable_chips.dart';
import 'package:youapp_test_mobileapp/app/theme/background_theme.dart';
import 'interests_controller.dart';

class InterestsView extends GetView<InterestsController> {
  const InterestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Get.offNamed('/home'),
            child: Padding(
              padding: EdgeInsets.only(left: 2),
              child: Row(
                children: [
                  Icon(Icons.chevron_left, size: 20.0, weight: 2.0),
                  Text('Back', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 26),
              child: InkWell(
                onTap: controller.updateInterests,
                child: ShaderMask(
                  shaderCallback:
                      (bounds) => LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xFFABFFFD),
                          Color(0xFF4599DB),
                          Color(0xFFAADAFF),
                        ],
                      ).createShader(bounds),
                  child: Text(
                    'Save',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: ShaderMask(
                    shaderCallback:
                        (bounds) => LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xFF94783E),
                            Color(0xFFF3EDA6),
                            Color(0xFFF8FAE5),
                            Color(0xFFFFE2BE),
                            Color(0xFFD5BE88),
                            Color(0xFFF8FAE5),
                            Color(0xFFD5BE88),
                          ],
                        ).createShader(bounds),
                    child: Text(
                      'Tell everyone about yourself',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    'What interest you?',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 35),
                FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      EditableChipsInput(
                        hintText: 'Add your interests',
                        initialChips: controller.interests,
                        onChanged: (chips) => controller.setInterests(chips),
                      ),
                    ],
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
