import 'package:flutter/material.dart';

class rTextField extends StatelessWidget {
  rTextField({super.key, this.controller});

  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(controller: controller, decoration: InputDecoration());
  }
}
