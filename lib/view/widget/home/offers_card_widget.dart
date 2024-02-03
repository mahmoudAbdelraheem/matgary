import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

class OffersCardWidget extends StatelessWidget {
  const OffersCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.myBlue.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              title: Text(
                'Summer Offers',
                style: TextStyle(
                  height: 4,
                  color: AppColors.myWhite,
                ),
              ),
              subtitle: Text(
                'Summer Offers',
                style: TextStyle(
                  color: AppColors.myWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: -19,
            right: -19,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: AppColors.myBlue,
                borderRadius: BorderRadius.circular(160),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.myBlack.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: const Offset(-10, 10),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
