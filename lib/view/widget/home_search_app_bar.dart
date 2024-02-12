import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

class HomeSearchAppBar extends StatelessWidget {
  final String hintText;
  final void Function()? onPressedSearch;
  final void Function()? onPressedFavorite;
  const HomeSearchAppBar({
    super.key,
    required this.hintText,
    required this.onPressedSearch,
    required this.onPressedFavorite,
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
          onPressedIcon: onPressedFavorite,
          icon: Icons.favorite_border_outlined,
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
