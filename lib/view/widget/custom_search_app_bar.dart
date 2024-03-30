import 'package:flutter/material.dart';
import '../../core/constant/app_colors.dart';

class CustomSearchAppBar extends StatelessWidget {
  final String hintText;
  final TextEditingController myController;
  final void Function()? onPressedSearch;
  final void Function(String)? onFromChange;
  final void Function()? onPressedNotify;
  const CustomSearchAppBar({
    super.key,
    required this.hintText,
    required this.myController,
    required this.onPressedSearch,
    required this.onPressedNotify,
    required this.onFromChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.myBlue.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              onChanged: onFromChange,
              controller: myController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                hintText: hintText,
                hintStyle: TextStyle(color: AppColors.myGrey),
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                prefixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: Icon(
                    Icons.search,
                    color: AppColors.myGrey,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        AppBarIconWidget(
          onPressedIcon: onPressedNotify,
          icon: Icons.notifications_on_outlined,
        ),
      ],
    );
  }
}

class AppBarIconWidget extends StatelessWidget {
  final void Function()? onPressedIcon;
  final IconData icon;
  const AppBarIconWidget({
    super.key,
    required this.onPressedIcon,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 55,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.myBlue.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: IconButton(
        onPressed: onPressedIcon,
        icon: Icon(
          icon,
          color: AppColors.myGrey,
        ),
      ),
    );
  }
}
