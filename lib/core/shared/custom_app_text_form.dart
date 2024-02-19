// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppTextFom extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData sufixIcon;
  final String? Function(String?) myValidator;
  final TextEditingController myController;
  final TextInputType myKeyboardType;
  final void Function()? showPassword;
  final bool? isPassword;
  const CustomAppTextFom({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.sufixIcon,
    required this.myValidator,
    required this.myController,
    required this.myKeyboardType,
    this.showPassword,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator: myValidator,
        keyboardType: myKeyboardType,
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
          suffixIcon: InkWell(onTap: showPassword, child: Icon(sufixIcon)),
          hintStyle: const TextStyle(fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
