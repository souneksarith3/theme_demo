import 'package:get/get.dart';

class HomeController extends GetxController {
  final _isChecked = false.obs;

  get getIsChecked => _isChecked.value;
  void setIsChecked(bool value){
    _isChecked.value = value;
  }

}