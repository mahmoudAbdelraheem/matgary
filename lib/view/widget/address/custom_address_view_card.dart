import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/data/models/address_model.dart';

class CustomAddressViewCard extends StatelessWidget {
  final AddressModel model;
  final void Function()? onTap;

  final void Function()? onDelete;
  const CustomAddressViewCard({
    super.key,
    required this.model,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shadowColor: AppColors.myGrey,
          elevation: 10,
          child: ListTile(
            dense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            title: Text(
              model.addressName!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.myGrey,
                height: 1,
              ),
            ),
            subtitle: Text(
              model.addressCity!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.myGrey,
                height: 2,
              ),
            ),
            trailing: IconButton(
              onPressed: onDelete,
              icon: Icon(
                Icons.delete_forever_outlined,
                color: AppColors.myRed,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
