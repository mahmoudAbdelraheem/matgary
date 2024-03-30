import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/address/add_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/functions/form_valid_input.dart';
import '../../../core/shared/custom_app_botton.dart';
import '../../../core/shared/custom_app_text_form.dart';

class UserAddressDetails extends GetView<AddControllerImp> {
  const UserAddressDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      color: AppColors.myWhite,
      child: Form(
        //? key form for text form validation
        key: controller.formState,
        child: ListView(
          children: [
            //? page Text
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Enter Address Details.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            //? city Text form
            const SizedBox(height: 10),
            CustomAppTextForm(
              hintText: 'City Name',
              labelText: 'City',
              sufixIcon: Icons.location_city_sharp,
              myValidator: (val) {
                return formVaildInput(
                  value: val!,
                  type: 'city',
                  min: 5,
                  max: 40,
                );
              },
              myController: controller.cityController,
              myKeyboardType: TextInputType.text,
            ),
            //? street Text form

            const SizedBox(height: 10),
            CustomAppTextForm(
              hintText: 'Street Name',
              labelText: 'Street',
              sufixIcon: Icons.streetview_outlined,
              myValidator: (val) {
                return formVaildInput(
                  value: val!,
                  type: 'street',
                  min: 5,
                  max: 40,
                );
              },
              myController: controller.streetController,
              myKeyboardType: TextInputType.text,
            ),
            //? location name Text form
            const SizedBox(height: 10),
            CustomAppTextForm(
              hintText: 'Location Name',
              labelText: 'Name',
              sufixIcon: Icons.location_on_outlined,
              myValidator: (val) {
                return formVaildInput(
                  value: val!,
                  type: 'location',
                  min: 5,
                  max: 40,
                );
              },
              myController: controller.nameController,
              myKeyboardType: TextInputType.text,
            ),
            //? page button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomAppBotton(
                  btnText: 'Back',
                  btnColor: AppColors.myBlue,
                  textColor: AppColors.myWhite,
                  myPressed: () {
                    //? back to the map page
                    controller.backPage();
                  },
                ),
                CustomAppBotton(
                  btnText: 'Save',
                  btnColor: AppColors.myBlue,
                  textColor: AppColors.myWhite,
                  myPressed: () {
                    controller.addUserAddress();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
