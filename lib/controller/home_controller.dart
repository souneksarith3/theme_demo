import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    if(ctlGmail.text.length < 1 && ctlPassword.text.length < 1 && ctlConfirm.text.length < 1){
      _isChecked.value = false;
    } else {
      if (ctlPassword.text == ctlConfirm.text) {
        _isChecked.value = value;
      } else {
        _isChecked.value = false;
      }
    }
  }
}
