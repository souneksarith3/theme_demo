import 'package:flutter/material.dart';
import 'package:theme_demo/config/routes/route_name.dart';
import 'package:theme_demo/config/themes/app_theme.dart';
import 'package:theme_demo/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:theme_demo/controller/student_controller.dart';
import 'package:theme_demo/screens/pages/attendance_page.dart';
import 'package:theme_demo/screens/pages/exam_page.dart';
import 'package:theme_demo/screens/pages/student_page.dart';

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
    navBar(title: "Attendence", icon: Icons.receipt_long_sharp),
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
      floatingActionButton: _buildFloating(),
      bottomNavigationBar: _buildNavBar(),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      title: Text("Profile", style: AppTheme.lightTheme.textTheme.bodyLarge),
      centerTitle: true,
    );
  }

  Widget _buildFloating(){
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed(RouteName.studentAdd);
      },
      backgroundColor: AppTheme.primaryLight,
      child: Icon(Icons.add, color: Colors.white, size: 40,),
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
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
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
                        duration: Duration(milliseconds: 300),
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
        StudentPage(),
        AttendancePage(),
        ExamPage(),
      ],
    );
  }
}
