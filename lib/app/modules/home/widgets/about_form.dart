import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'about_controller.dart';

class AboutForm extends StatelessWidget {
  AboutForm({super.key});

  final AboutController controller = Get.put(AboutController());
  final List<String> genderOptions = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 15,
            children: [
              GestureDetector(
                onTap: controller.pickImage,
                child: Obx(() {
                  final image = controller.imageFile.value;

                  return Container(
                    width: 57,
                    height: 57,
                    decoration: BoxDecoration(
                      color: Color(0xFF212B31),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child:
                        image != null
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                image,
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                              ),
                            )
                            : Center(
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: Color(0xFFD5BE88),
                              ),
                            ),
                  );
                }),
              ),
              Text('Add Image'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(flex: 1, child: Text('Display name:')),
              Expanded(
                flex: 2,
                child: FormBuilderTextField(
                  name: 'name',
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(hintText: 'Enter Name'),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(flex: 1, child: Text('Gender:')),
              Expanded(
                flex: 2,
                child: FormBuilderDropdown(
                  name: 'gender',
                  decoration: InputDecoration(hintText: 'Select Gender'),
                  items:
                      genderOptions
                          .map(
                            (gender) => DropdownMenuItem(
                              alignment: AlignmentDirectional.centerEnd,
                              value: gender,
                              child: Text(gender),
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(flex: 1, child: Text('Birthday:')),
              Expanded(
                flex: 2,
                child: FormBuilderDateTimePicker(
                  name: 'birthday',
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(hintText: 'DD MM YYYY'),
                  inputType: InputType.date,
                  format: DateFormat('dd MM yyyy'),
                  onChanged: (date) {
                    if (date != null) {
                      controller.setZodiacAndHoroscope(date);
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(flex: 1, child: Text('Horoscope:')),
              Expanded(
                flex: 2,
                child: FormBuilderTextField(
                  name: 'horoscope',
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(hintText: '--'),
                  enabled: false,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(flex: 1, child: Text('Zodiac:')),
              Expanded(
                flex: 2,
                child: FormBuilderTextField(
                  name: 'zodiac',
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(hintText: '--'),
                  enabled: false,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(flex: 1, child: Text('Height:')),
              Expanded(
                flex: 2,
                child: FormBuilderTextField(
                  name: 'height',
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                    hintText: 'Add Height',
                    suffixText: ' cm',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(flex: 1, child: Text('Weight:')),
              Expanded(
                flex: 2,
                child: FormBuilderTextField(
                  name: 'weight',
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                    hintText: 'Add Weight',
                    suffixText: ' kg',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
