import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';

class OffersCardWidget extends StatelessWidget {
  const OffersCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.myBlue.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            right: -80,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: AppColors.myBlue,
                borderRadius: BorderRadius.circular(160),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.myBlack.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(-10, 10),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Summer Offers',
              style: TextStyle(
                height: 4,
                color: AppColors.myWhite,
              ),
            ),
            subtitle: Text(
              'Cashback 20%',
              style: TextStyle(
                color: AppColors.myWhite,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
