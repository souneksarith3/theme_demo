import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _isChecked = false.obs;
  final ctlGmail = TextEditingController();
  final ctlPassword = TextEditingController();
  final ctlConfirm = TextEditingController();

  bool get getIsChecked => _isChecked.value;
  void setIsChecked(bool value) {
    if(ctlGmail.text.length < 1 && ctlPassword.text.length < 1 && ctlConfirm.text.length < 1){
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
}
