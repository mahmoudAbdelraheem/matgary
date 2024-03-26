import 'package:flutter/material.dart';

class AddAdressWidget extends StatelessWidget {
  final void Function()? onTap;
  const AddAdressWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 25),
        width: double.infinity,
        alignment: Alignment.center,
        child: const Text(
          'You Don\'t Have An Address Yet!\nClick Here To Add An Address For you.',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
