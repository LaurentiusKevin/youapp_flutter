import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:youapp_test_mobileapp/app/theme/background_theme.dart';
import 'package:youapp_test_mobileapp/app/widgets/gradient_button.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
                    'Login',
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
                            hintText: 'Enter Password',
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
                      SizedBox(height: 32),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GradientButton(
                            text: 'Login',
                            isLoading: controller.isLoading.value,
                            onPressed: controller.login,
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
                        TextSpan(text: 'No account? '),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () => Get.offNamed('/register'),
                            child: Text(
                              'Register here!',
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
