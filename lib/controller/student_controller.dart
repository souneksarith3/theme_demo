import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_demo/models/student_model.dart';

class StudentController extends GetxController {
  final currentIndex = 0.obs;

  final pgController = PageController();

  final studentList = [
    StudentModel(
      id: 1,
      name: "Neymar",
      gender: "Male",
      email: "neymar@123.gmail.com",
      address: "Brazil",
    ),
    StudentModel(
      id: 2,
      name: "Messi",
      gender: "Male",
      email: "messiloy@123.gmail.com",
      address: "Argentina",
    ),
    StudentModel(
      id: 3,
      name: "Lamin",
      gender: "Male",
      email: "laminyamal@123.gmail.com",
      address: "Spain",
    ),
    StudentModel(
      id: 4,
      name: "Dani Olmo",
      gender: "Male",
      email: "olmoolmo@123.gmail.com",
      address: "Spain",
    ),
  ];

  List<StudentModel> getStudentList() {
    return studentList;
  }

  int get getCurrentIndex => currentIndex.value;
  void setCurrentIndex(int value) {
    currentIndex.value = value;
  }
}
