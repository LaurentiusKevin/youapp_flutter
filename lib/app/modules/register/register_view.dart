import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:youapp_test_mobileapp/app/theme/background_theme.dart';
import 'package:youapp_test_mobileapp/app/widgets/gradient_button.dart';
import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Register',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: 16),
                FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'email',
                        decoration: InputDecoration(
                          hintText: 'Enter Username/Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      Obx(
                        () => FormBuilderTextField(
                          name: 'password',
                          obscureText: controller.isPasswordHidden.value,
                          decoration: InputDecoration(
                            hintText: 'Create Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordHidden.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password required';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      Obx(
                        () => FormBuilderTextField(
                          name: 'confirm_password',
                          obscureText: controller.isPasswordHidden.value,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordHidden.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                          ),
                          validator: (value) {
                            final password =
                                controller
                                    .formKey
                                    .currentState
                                    ?.fields['password']
                                    ?.value;
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != password) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 32),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GradientButton(
                            text: 'Register',
                            isLoading: controller.isLoading.value,
                            onPressed: controller.register,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Have an account? '),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () => Get.offNamed('/login'),
                            child: Text(
                              'Login here!',
                              style: const TextStyle(color: Color(0xFFE0C796)),
                            ),
                          ),
                        ),
                      ],
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
