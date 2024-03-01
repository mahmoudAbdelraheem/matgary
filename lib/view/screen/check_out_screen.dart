import 'package:flutter/material.dart';
import 'package:matgary/core/constant/app_colors.dart';
import 'package:matgary/core/constant/app_image_assets.dart';
import 'package:matgary/view/widget/ckeckout/coustom_chek_out_text.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: MaterialButton(
          height: 50,
          textColor: AppColors.myWhite,
          color: AppColors.myBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: () {},
          child: const Text(
            'Check Out',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Check Out'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            //? payment section
            const CoustomCheckOutText(title: 'Choose Payment Method.'),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.myBlue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.myWhite,
                    radius: 7,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Card',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.myGrey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.myBlue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.myBlue,
                    radius: 7,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Cash',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.myBlack,
                    ),
                  ),
                ],
              ),
            ),
            //? Delivery section
            const CoustomCheckOutText(title: 'Choose Delivery Type.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.myBlue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImageAssets.delivery,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: AppColors.myBlue,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Delivery',
                            style: TextStyle(
                              color: AppColors.myBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  height: 180,
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.myBlue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImageAssets.driveThru,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: AppColors.myWhite,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Drive Thru',
                            style: TextStyle(
                              color: AppColors.myGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //? address section
            const CoustomCheckOutText(title: 'Shipping Address.'),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: AppColors.myGrey,
              elevation: 10,
              child: ListTile(
                dense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                leading: CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.myBlue,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.myWhite,
                  ),
                ),
                title: Text(
                  "model.addressName!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myBlack,
                    height: 1,
                  ),
                ),
                subtitle: Text(
                  "model.addressCity!",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myBlack,
                    height: 2,
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: AppColors.myGrey,
              elevation: 10,
              child: ListTile(
                dense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                leading: CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.myBlue,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.myBlue,
                  ),
                ),
                title: Text(
                  "model.addressName!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myBlack,
                    height: 1,
                  ),
                ),
                subtitle: Text(
                  "model.addressCity!",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myBlack,
                    height: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
