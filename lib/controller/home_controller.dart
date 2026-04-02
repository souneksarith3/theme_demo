import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  final _isChecked = false.obs;
  final ctlGmail = TextEditingController();
  final ctlPassword = TextEditingController();
  final ctlConfirm = TextEditingController();

  bool get getIsChecked => _isChecked.value;
  void setIsChecked(bool value) {
    if (ctlGmail.text.isEmpty &&
        ctlPassword.text.isEmpty &&
        ctlConfirm.text.isEmpty) {
      _isChecked.value = false;
    } else {
      if (ctlPassword.text == ctlConfirm.text) {
        _isChecked.value = value;
      } else {
        _isChecked.value = false;
      }
    }
  }

  Future<void> login({String? username, String? password}) async {}

  Future<bool> signUp({String? username, String? password}) async {
    return false;
  }
}
