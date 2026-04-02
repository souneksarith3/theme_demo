import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:theme_demo/auth/auth_service.dart';
import 'package:theme_demo/screens/sign_up.dart';

class HomeController extends GetxController {
  final _isChecked = false.obs;
  final _passShow = false.obs;
  final formKey = GlobalKey<FormState>().obs;

  static final isLoading = false.obs;
  final ctlGmail = TextEditingController();
  final ctlPassword = TextEditingController();
  final ctlConfirm = TextEditingController();


  final supabase = Supabase.instance.client;
  final AuthService _authService = AuthService();

  bool get getIsChecked => _isChecked.value;
  void setIsChecked(bool value) {
    if(ctlGmail.text.isEmpty && ctlPassword.text.isEmpty && ctlConfirm.text.isEmpty){
      _isChecked.value = false;
    }
    else{
      if(ctlPassword.text == ctlConfirm.text){
        _isChecked.value = value;
      }
      else{
        _isChecked.value = false;
      }
    }
  }

  bool get getPassShow => _passShow.value;

  void setPassShow(bool value){
    _passShow.value = value;
  }

  Future<void> signUp() async{
    try{
      isLoading.value = true;
      await _authService.signUp(
        email: ctlGmail.text.trim(),
        password: ctlPassword.text.trim(),
      );
      Get.snackbar("Successful", "Sign Up successfuly", snackPosition: SnackPosition.TOP);
      Get.defaultDialog(
        title: "Success",
        backgroundColor: Colors.red.shade500,
      );
      Get.offAll(SignUp());
    }
    catch(ex){
      Get.snackbar("Faild", ex.toString(), snackPosition: SnackPosition.TOP);
      Get.defaultDialog(
        title: "Faild",
        backgroundColor: Colors.white54,
        custom: Icon(Icons.error_outline, color: Colors.red,),
        middleText: "Error: ${ex.toString()}!",
        
      );
    }
    finally{
      isLoading.value = false;
    }
  }

  
}
