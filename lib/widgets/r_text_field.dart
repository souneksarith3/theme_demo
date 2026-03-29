import 'package:flutter/material.dart';

class RTextField extends StatelessWidget {
  RTextField({super.key, this.controller});

  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(controller: controller, decoration: InputDecoration());
  }
}
