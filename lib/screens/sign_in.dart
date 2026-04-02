import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_demo/config/routes/route_name.dart';
import 'package:theme_demo/config/themes/app_theme.dart';
import 'package:theme_demo/controller/home_controller.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final controller = Get.put(HomeController());

  final List<IconData> IconsList = [
    Icons.apple,
    Icons.facebook,
    Icons.telegram,
    Icons.email,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: AppTheme.primaryLight),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 700,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
            ),
            child: SingleChildScrollView(
              child: Column(
                spacing: 15,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteName.home);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Text(
                    "Get Started",
                    style: AppTheme.lightTheme.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 10),
                  _buildForm(),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Container(
                            height: 1.5,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 14,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            height: 1.5,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildSignUpIcon(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpIcon() {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          IconsList.length,
          (index) => IconButton(
            onPressed: () {},
            icon: Icon(
              IconsList[index],
              size: 40,
              color: AppTheme.primaryLight,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: controller.loginFormKey.value,
      child: Row(
        children: [
          TextFormField(
            controller: controller.ctlPassword,
            decoration: InputDecoration(
              label: Text(
                "Username or Gmail",
                style: AppTheme.lightTheme.textTheme.bodyMedium,
              ),
            ),
          ),
          TextFormField(
            controller: controller.ctlPassword,
            decoration: InputDecoration(
              label: Text(
                "Password",
                style: AppTheme.lightTheme.textTheme.bodyMedium,
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text(
                "Show password",
                style: TextStyle(
                  fontFamily: AppTheme.fontFamily,
                  fontSize: 14,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
          MaterialButton(
            color: AppTheme.primaryLight,
            minWidth: double.infinity,
            height: 45,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            onPressed: () async {
              final r = await controller.logIn(
                password: controller.ctlGmail.text.trim(),
                email: controller.ctlGmail.text.trim(),
              );
            },
            child: Text(
              "Log in",
              style: TextStyle(
                fontFamily: AppTheme.fontFamily,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
