import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_demo/config/themes/app_theme.dart';
import 'package:theme_demo/controller/student_controller.dart';

class StudentUpdate extends StatelessWidget {
  StudentUpdate({super.key});

  final StudentController controller = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: _buildBody());
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Update Student Form",
                style: TextStyle(fontFamily: AppTheme.fontFamily, fontSize: 24),
              ),
            ),
            Form(
              child: Column(
                spacing: 20,
                children: [
                  _buildTextFormField(label: "Student ID"),
                  _buildTextFormField(label: "Student Name"),
                  Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            contentPadding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            dense: true,
                            value: "Male",
                            onChanged: (value) =>
                                controller.ctlGender.value = value!,
                            groupValue: controller.ctlGender.value,
                            title: Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: AppTheme.fontFamily,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            contentPadding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            dense: true,
                            value: "Female",
                            onChanged: (value) =>
                                controller.ctlGender.value = value!,
                            groupValue: controller.ctlGender.value,
                            title: Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: AppTheme.fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildTextFormField(
                    label: "Email",
                    keyboard: TextInputType.emailAddress,
                  ),
                  _buildTextFormField(label: "Address"),
                  _buildMaterialButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    TextEditingController? controller,
    String? label,
    TextInputType keyboard = TextInputType.text,
  }) {
    return TextFormField(
      decoration: InputDecoration(label: Text(label!)),
      controller: controller,
      keyboardType: keyboard,
    );
  }

  Widget _buildMaterialButton() {
    return MaterialButton(
      onPressed: () {},
      height: 50,
      minWidth: double.infinity,
      color: AppTheme.primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(18)),
      ),
      child: Text(
        "Update Student",
        style: TextStyle(
          fontFamily: AppTheme.fontFamily,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
