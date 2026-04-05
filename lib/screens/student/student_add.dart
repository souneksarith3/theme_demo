import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_demo/config/themes/app_theme.dart';
import 'package:theme_demo/controller/student_controller.dart';
import 'package:theme_demo/config/themes/app_theme.dart';

class StudentAdd extends StatelessWidget {
  StudentAdd({super.key});

  final stdController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new student"), centerTitle: true),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [_buildStudentForm()]),
      ),
    );
  }

  Widget _buildStudentForm() {
    return Form(
      key: stdController.stdFormKey,
      child: Column(
        spacing: 18,
        children: [
          Text(
            "Student Form",
            style: AppTheme.lightTheme.textTheme.headlineLarge,
          ),
          _buildTextFormField(
            controller: stdController.ctlName,
            label: "Student name",
          ),
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 6,
                children: [
                  Expanded(
                    flex: 0,
                    child: Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: AppTheme.fontFamily,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: RadioListTile<String>(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Male",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: AppTheme.fontFamily,
                        ),
                      ),
                      value: "Male",
                      groupValue: stdController.ctlGender.value,
                      onChanged: (value) {
                        stdController.ctlGender.value = value!;
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Text(
                        "Female",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: AppTheme.fontFamily,
                        ),
                      ),
                      value: "Female",
                      groupValue: stdController.ctlGender.value,
                      onChanged: (value) {
                        stdController.ctlGender.value = value!;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildTextFormField(
            controller: stdController.ctlEmail,
            label: "Email",
          ),
          _buildTextFormField(
            controller: stdController.ctlAddress,
            label: "Address",
          ),
          MaterialButton(
            onPressed: () {},
            height: 50,
            minWidth: double.infinity,
            color: AppTheme.primaryLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(18)),
            ),
            child: Text(
              "Add",
              style: TextStyle(
                fontFamily: AppTheme.fontFamily,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    TextEditingController? controller,
    String? label,
  }) {
    return TextFormField(
      decoration: InputDecoration(label: Text(label!)),
      controller: controller,
    );
  }
  
}
