import 'package:flutter/material.dart';
import 'package:theme_demo/config/themes/app_theme.dart';
import 'package:theme_demo/controller/home_controller.dart';
import 'package:get/get.dart';

class navBar {
  String title;
  IconData icon;
  navBar({required this.title, required this.icon});
}

class Profile extends StatelessWidget {
  Profile({super.key});
  final controller = Get.put(HomeController());

  final List<navBar> _navBarList = [
    navBar(title: "Student", icon: Icons.people),
    navBar(title: "Attendent", icon: Icons.receipt_long_sharp),
    navBar(title: "Exam", icon: Icons.workspace_premium_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      bottomNavigationBar: _buildNavBar(),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      title: Text("Profile", style: AppTheme.lightTheme.textTheme.bodyLarge),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(18),
      //child: Text(controller.session()),
    );
  }

  Widget _buildNavBar() {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.primaryLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _navBarList.length,
            (index) => Flexible(
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: controller.currentIndex.value == index
                      ? Colors.purple.shade300
                      : Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = index;
                    print(controller.currentIndex.toString());
                  },
                  child: Column(
                    children: [
                      Icon(_navBarList[index].icon, color: Colors.white),
                      Text(
                        _navBarList[index].title,
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
