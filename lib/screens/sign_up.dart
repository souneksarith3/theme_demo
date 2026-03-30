import 'package:flutter/material.dart';
import 'package:theme_demo/config/routes/route_name.dart';
import 'package:theme_demo/config/themes/app_theme.dart';
import 'package:theme_demo/controller/home_controller.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final HomeController controller = Get.put(HomeController());
  final List<IconData> IconsList = [
    Icons.apple,
    Icons.facebook,
    Icons.telegram,
    Icons.email,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: Icon(Icons.arrow_back), body: _BuildBody);
  }

  get _BuildBody {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppTheme.primaryLight,
      child: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: 750,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                spacing: 20,
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(RouteName.home);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  Text(
                    "Get Started",
                    style: AppTheme.lightTheme.textTheme.headlineLarge,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.ctlGmail,
                    decoration: InputDecoration(
                      label: Text(
                        "Gmail",
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
                  TextFormField(
                    controller: controller.ctlConfirm,
                    decoration: InputDecoration(
                      label: Text(
                        "Confirm Password",
                        style: AppTheme.lightTheme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        Checkbox(
                          value: controller.getIsChecked,
                          onChanged: (value) {
                            controller.setIsChecked(value!);
                          },
                          fillColor: WidgetStatePropertyAll(
                            controller.getIsChecked == true
                                ? AppTheme.primaryLight
                                : Colors.transparent,
                          ),
                        ),
                        Text("I agree to send my informaton"),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: AppTheme.primaryLight,
                    minWidth: double.infinity,
                    height: 45,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppTheme.fontFamily,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      spacing: 0,
                      mainAxisAlignment: .spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            height: 1.2,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "Sign in with",
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            height: 1.2,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      IconsList.length,
                      (index) => IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconsList[index],
                          color: AppTheme.primaryLight,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    clipBehavior: Clip.none,
                    onPressed: () {
                      Get.toNamed(RouteName.signIn);
                    },
                    child: Text(
                      "Already have account?",
                      style: TextStyle(
                        color: AppTheme.primaryLight,
                        fontFamily: AppTheme.fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
