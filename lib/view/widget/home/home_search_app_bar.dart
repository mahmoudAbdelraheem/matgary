import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

class HomeSearchAppBar extends StatelessWidget {
  const HomeSearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.myBlue.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.myBlack,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.myBlue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.notifications_on_outlined,
            color: AppColors.myBlack,
          ),
        ),
      ],
    );
  }
}
