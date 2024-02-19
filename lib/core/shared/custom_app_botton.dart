import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBotton extends StatelessWidget {
  final String btnText;
  final Color textColor;
  final Color btnColor;
  final void Function() myPressed;
  const CustomAppBotton({
    super.key,
    required this.btnText,
    required this.btnColor,
    required this.textColor,
    required this.myPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, bottom: 25),
      child: MaterialButton(
        onPressed: myPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: btnColor,
        //textColor: Colors.white,
        height: 40,
        child: Text(
          btnText.tr,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
