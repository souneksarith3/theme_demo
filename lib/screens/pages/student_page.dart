import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_demo/config/routes/route_name.dart';
import 'package:theme_demo/controller/student_controller.dart';
import 'package:theme_demo/screens/student/student_update.dart';

class StudentPage extends StatelessWidget {
  StudentPage({super.key});

  final stdController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: stdController.studentList.length,
        itemBuilder: (context, index) {
          final std = stdController.studentList[index];
          return GestureDetector(
            onTap: () {
              print(index.toString());
              print(std.name.toString());

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
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: Text("[ID: ${std.id}] Name: ${std.name}"),
                      ),
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: Text("Gendr: ${std.gender}"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: Text("${std.email}"),
                      ),
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: Text("Address: ${std.address}"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
