import 'package:face_attendance/constants/app_colors.dart';
import 'package:face_attendance/constants/app_defaults.dart';
import 'package:face_attendance/constants/app_sizes.dart';
import 'package:face_attendance/views/pages/05_verifier/static_verifier.dart';
import 'package:face_attendance/views/themes/text.dart';
import 'package:face_attendance/views/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* <---- This is a bottom sheet ----> */

class StaticVerifierUnlock extends StatefulWidget {
  const StaticVerifierUnlock({Key? key}) : super(key: key);

  @override
  _StaticVerifierUnlockState createState() => _StaticVerifierUnlockState();
}

class _StaticVerifierUnlockState extends State<StaticVerifierUnlock> {
  /* <---- Text Editing Controllers ----> */
  late TextEditingController passController;

  /* <---- Show Password ----> */
  RxBool _showPass = false.obs;
  _onEyeClick() {
    _showPass.value = !_showPass.value;
  }

  @override
  void initState() {
    super.initState();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.DEFAULT_PADDING),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppDefaults.defaultBoxShadow,
        borderRadius: AppDefaults.defaultBottomSheetRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /* <---- Head Divider ----> */
          Container(
            width: Get.width * 0.25,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.PLACEHOLDER_COLOR,
            ),
          ),
          AppSizes.hGap10,
          /* <---- HeadLine ----> */
          Text(
            'Enter Password',
            style: AppText.h6.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.PRIMARY_COLOR,
            ),
          ),
          AppSizes.hGap20,
          /* <---- Password Form ----> */
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Obx(
              () => TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.vpn_key_rounded),
                  hintText: '***********',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _onEyeClick();
                    },
                    child: Icon(
                      _showPass.isFalse
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                    ),
                  ),
                ),
                controller: passController,
                obscureText: !_showPass.value,
              ),
            ),
          ),

          /* <---- Submit Button ----> */
          AppButton(
            width: Get.width * 0.6,
            label: 'Unlock',
            onTap: () {
              Get.back();
              Get.to(() => StaticVerifierScreen());
            },
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot Password?',
              style: AppText.b1.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.PRIMARY_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }
}