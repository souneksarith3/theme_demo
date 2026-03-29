import 'package:flutter/material.dart';
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
            height: 720,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                spacing: 20,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Get Started",
                    style: AppTheme.lightTheme.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Gmail",
                        style: AppTheme.lightTheme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(
                        "Password",
                        style: AppTheme.lightTheme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  TextFormField(
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
                    onPressed: () {},
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
