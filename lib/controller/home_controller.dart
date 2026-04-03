import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:theme_demo/auth/auth_service.dart';

class HomeController extends GetxController {
  final _isChecked = false.obs;
  final _passShow = false.obs;
  final formKey = GlobalKey<FormState>().obs;
  final loginFormKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final currentIndex = 0.obs;

  final ctlGmail = TextEditingController();
  final ctlPassword = TextEditingController();
  final ctlConfirm = TextEditingController();

  final ctlLoginEmail = TextEditingController();
  final ctlLoginPass = TextEditingController();

  final supabase = Supabase.instance.client;
  final AuthService _authService = AuthService();

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

  bool get getPassShow => _passShow.value;
  void setPassShow(bool value) {
    _passShow.value = value;
  }

  Future<AuthResponse?> signUp({String? email, String? password}) async {
    try {
      isLoading.value = true;
      final rs = await _authService.signUp(email: email, password: password);
      return rs;
    } on AuthApiException catch (e) {
      Get.snackbar(
        "Sign up failed",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    } catch (e) {
      Get.snackbar(
        "Error: ",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<AuthResponse?> logIn({required String email, required String password}) async {
    try {
      isLoading.value = true;
      final rs = await _authService.signIn(email: email, password: password);
      return rs;
    } on AuthApiException catch (e) {
      Get.snackbar(
        "Sign in failed ${isLoading.value.toString()}",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    } catch (e) {
      Get.snackbar(
        "Error: ",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}
