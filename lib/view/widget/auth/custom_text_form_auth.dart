import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFomAuthWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData sufixIcon;
  final TextEditingController myController;
  final bool? isPassword;
  const CustomTextFomAuthWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.sufixIcon,
    required this.myController,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: myController,
        obscureText: isPassword!,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(labelText.tr),
          ),
          hintText: hintText.tr,
          suffixIcon: isPassword!
              ? IconButton(onPressed: () {}, icon: Icon(sufixIcon))
              : Icon(sufixIcon),
          hintStyle: const TextStyle(fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
