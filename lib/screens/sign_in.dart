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
      key: controller.loginFormKey,
      child: Column(
        spacing: 15,
        children: [
          //===============[EMAIL TEXTFIELD]==================
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmail == false) {
                return "Please enter email with <.com>";
              }
              return null;
            },
            controller: controller.ctlLoginEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              label: Text(
                "Email",
                style: TextStyle(
                  fontFamily: AppTheme.fontFamily,
                  color: Colors.grey,
                ),
              ),
              //contentPadding: EdgeInsets.symmetric(horizontal: 5),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
            ),
          ),
          //================[PASSWORD TEXTFIELD]=============
          TextFormField(
            controller: controller.ctlLoginPass,
            validator: (value) {
              if (value == null || value.isEmpty == true) {
                return "Please enter password...";
              }
              return null;
            },
            decoration: InputDecoration(
              label: Text(
                "Password",
                style: TextStyle(
                  fontFamily: AppTheme.fontFamily,
                  color: Colors.grey,
                ),
              ),
              //contentPadding: EdgeInsets.symmetric(horizontal: 5),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
            ),
          ),
          //==============[Button]================
          Container(
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 50,
            child: Obx(
              () => MaterialButton(
                color: AppTheme.primaryLight,
                height: double.infinity,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(18),
                  ),
                ),
                onPressed: controller.isLoading.value == true
                    ? null
                    : () async {
                        if (controller.loginFormKey.currentState!.validate() ==
                            true) {
                          final rs = await controller.logIn(
                            email: controller.ctlLoginEmail.text.trim(),
                            password: controller.ctlLoginPass.text.trim(),
                          );
                          if (rs != null) {
                            Get.snackbar(
                              "Sign in success",
                              "",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            controller.ctlLoginEmail.text = "";
                            controller.ctlLoginPass.text = "";
                            Get.offNamed(RouteName.profile);
                          } else {
                            Get.snackbar(
                              "Error: ",
                              "Sign in failed",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        }
                      },
                child: controller.isLoading.value == true
                    ? CircularProgressIndicator()
                    : Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 18,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
