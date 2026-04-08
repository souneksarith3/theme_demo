import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_demo/models/student_model.dart';
import 'package:theme_demo/service/student_service.dart';

class StudentController extends GetxController {
  final currentIndex = 0.obs;
  final isLoading = false.obs;
  final validation = "".obs;

  final StudentService studentService = StudentService();
  final list = <StudentModel>[].obs;

  final pgController = PageController();
  final ctlId = TextEditingController();
  final ctlName = TextEditingController();
  final ctlGender = "Male".obs;
  final ctlEmail = TextEditingController();
  final ctlAddress = TextEditingController();
  final selectGender = 1.obs;

  final stdFormKey = GlobalKey<FormState>();
  final stdUpdateFormKey = GlobalKey<FormState>();

  final List<StudentModel> studentList = [
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
  ].obs;

  List<StudentModel> getStudentList() {
    return studentList;
  }

  int get getCurrentIndex => currentIndex.value;
  void setCurrentIndex(int value) {
    currentIndex.value = value;
  }

  StudentModel getStudentModel() => StudentModel(
    //id: ctlId.text.isEmpty == true ? int.parse(ctlId.text.trim()) : 0,
    name: ctlName.text,
    gender: ctlGender.value.toString(),
    email: ctlEmail.text.trim(),
    address: ctlAddress.text,
  );

  void clearFill(){
    ctlName.clear();
    ctlId.clear();
    ctlGender.value = "Male";
    ctlEmail.clear();
    ctlAddress.clear();
  }


  Future<void> addStudent(StudentModel model) async {
    try {
      isLoading.value = true;
      await studentService.addStudent(model);
      Get.snackbar("Success", "One row added");
      Get.back();
      getStudent();
      clearFill();
    } catch (e) {
      Get.snackbar("Error: ", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getStudent() async {
    try {
      isLoading.value = true;
      final response = await studentService.getStudent();
      list.value = (response).map((e) => StudentModel.fromMap(e)).toList();
    } catch (e) {
      Get.snackbar("Error: ", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateStudent(int id, StudentModel std) async{
    try {
      isLoading.value = true;
      await studentService.updateStudent(id, std);
      Get.back();
      clearFill();
    } catch (e) {
      Get.snackbar("Error: ", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteStudent(int id) async{
    try{
      isLoading.value = true;
      await studentService.deleteStudent(id);
      Get.back();
      clearFill();
    }
    catch (e){
      Get.snackbar("Error: ", e.toString());
    }
    finally{
      isLoading.value = false;
    }
  }
}
