import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/common_widgets.dart';
import '../../../common/spaces_boxes.dart';
import '../../../common/styles.dart';
import '../../../login_page.dart';

class ChooseSignUpPage extends StatelessWidget {
  const ChooseSignUpPage({Key? key}) : super(key: key);
  static const id = "/ChooseSignUpPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.primaryColor.value,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Hero(
                  tag: "logoSigUp",
                  child: Image.asset(
                    "assets/images/travel.png",
                    height: 300,
                    width: 300,
                    color: AppColor.whiteColor.value,
                  ),
                ),
              ),
            ),
            vSpace,
            Text(
              "Sign up for account",
              style: AppTextStyles.textStyleBoldSubTitleLarge,
            ),
            vSpace,
            Button(
              onTap: () {
                // Get.toNamed(DriverSignUpScreen.id);
              },
              buttonText: "Sign up as travelers",
              textColor: AppColor.whiteColor.value,
              postFixIcon: Icon(
                Icons.arrow_forward,
                color: AppColor.whiteColor.value,
              ),
            ),
            vSpace,
            Button(
              onTap: () {
                // Get.toNamed(UserSignUpScreen.id);
              },
              buttonText: "Sign up as service provider",
              textColor: AppColor.whiteColor.value,
              postFixIcon: Icon(
                Icons.arrow_forward,
                color: AppColor.whiteColor.value,
              ),
            ),
            vSpace,
            Text(
              "Already have an account?",
              style: AppTextStyles.textStyleNormalBodyMedium,
            ),
            InkWell(
              onTap: () {
                Get.offAndToNamed(LoginPage.id);
              },
              child: Text(
                "Login",
                style: AppTextStyles.textStyleBoldBodyMedium.copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColor.primaryBlueDarkColor.value),
              ),
            ),
            vSpace,
          ],
        ),
      ),
    );
  }
}
