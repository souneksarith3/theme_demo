import 'package:flutter/material.dart';
import 'package:theme_demo/config/themes/app_theme.dart';
import 'package:theme_demo/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:theme_demo/controller/student_controller.dart';

class navBar {
  String title;
  IconData icon;
  navBar({required this.title, required this.icon});
}

class Profile extends StatelessWidget {
  Profile({super.key});
  final stdController = Get.put(StudentController());

  final List<navBar> _navBarList = [
    navBar(title: "Student", icon: Icons.people),
    navBar(title: "Attendent", icon: Icons.receipt_long_sharp),
    navBar(title: "Exam", icon: Icons.workspace_premium_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _buildPageView(),
      ),
      bottomNavigationBar: _buildNavBar(),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      title: Text("Profile", style: AppTheme.lightTheme.textTheme.bodyLarge),
      centerTitle: true,
    );
  }

  Widget _buildNavBar() {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 76,
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
                  color: stdController.getCurrentIndex == index
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: GestureDetector(
                  onTap: () {
                    stdController.setCurrentIndex(index);
                    print(stdController.currentIndex.toString());
                    stdController.pgController.animateToPage(
                      stdController.getCurrentIndex,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.linear,
                    );
                  },
                  child: Column(
                    children: [
                      Icon(
                        _navBarList[index].icon,
                        color: stdController.getCurrentIndex == index
                            ? Colors.black
                            : Colors.white,
                      ),
                      Text(
                        _navBarList[index].title,
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          color: stdController.getCurrentIndex == index
                              ? Colors.black
                              : Colors.white,
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

  Widget _buildPageView() {
    return PageView(
      controller: stdController.pgController,
      onPageChanged: (value) {
        print("${stdController.pgController}: ${value.toString()}");
        stdController.setCurrentIndex(value);
      },
      children: [
        Container(
          padding: EdgeInsets.all(18),
          child: ListView(
            children: List.generate(
              stdController.studentList.length,
              (index) => GestureDetector(
                onTap: () {
                  print(index.toString());
                },
                child: Container(
                  padding: EdgeInsets.all(4),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.amber),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 4,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.white,
                            width: 200,
                            height: 40,
                            child: Text(
                              "${stdController.getStudentList()[index].id}",
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: 200,
                            height: 40,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.white,
                            width: 200,
                            height: 40,
                          ),
                          Container(
                            color: Colors.white,
                            width: 200,
                            height: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(child: Text("Page index 1")),
        Container(child: Text("Page index 2")),
      ],
    );
  }
}
