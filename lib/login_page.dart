import 'package:daryaft_flutter/common/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/common_widgets.dart';
import 'common/loading_widget.dart';
import 'common/spaces_boxes.dart';
import 'common/styles.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  static const id = '/LoginPage';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<LoginController>(
          initState: (state) {},
          builder: (_) {
            controller.loading.value;

            return Stack(
              children: [
                SingleChildScrollView(
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
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
                                  width: 200,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                          ),
                          vSpace,
                          Text(
                            "Login to continue",
                            style: AppTextStyles.textStyleBoldSubTitleLarge,
                          ),
                          vSpace,
                          vSpace,
                          MyTextField(
                              controller: controller.emailController,
                              hintText: "Email",
                              contentPadding: 16 /* context.height * 0.04*/,
                              prefixIcon: "assets/icons/ic_mail.svg",
                              focusBorderColor: AppColor.primaryBlueDarkColor,
                              textColor: AppColor.blackColor,
                              hintColor: AppColor.blackColor,
                              fillColor: AppColor.alphaGrey,
                              validator: (String? value) =>
                                  value!.toValidEmail()),
                          vSpace,
                          Obx(
                            () => MyTextField(
                              controller: controller.passwordController,
                              contentPadding: 16 /* context.height * 0.04*/,
                              suffixIconWidet: GestureDetector(
                                  onTap: () {
                                    controller.isObscure.value =
                                        !controller.isObscure.value;
                                  },
                                  child: Icon(controller.isObscure.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined)),
                              hintText: "Password",
                              prefixIcon: "assets/icons/ic_lock.svg",
                              focusBorderColor: AppColor.primaryBlueDarkColor,
                              textColor: AppColor.blackColor,
                              hintColor: AppColor.blackColor,
                              fillColor: AppColor.alphaGrey,
                              obsecureText: controller.isObscure.value,
                              validator: (String? value) =>
                                  value!.toValidPassword(),
                            ),
                          ),
                          vSpace,
                          vSpace,
                          Button(
                            buttonText: "Log in",
                            padding: 16 /*context.height * 0.04*/,
                            textColor: AppColor.whiteColor,
                            color: AppColor.primaryBlueDarkColor,
                            onTap: () {
                              FocusScope.of(context).unfocus();

                              //     controller.createAdminUser();
                              if (_formKey.currentState!.validate()) {
                                controller.login();
                              }
                            },
                          ),
                          vSpace,
                          Text(
                            "Don't have an account?",
                            style: AppTextStyles.textStyleNormalBodyMedium,
                          ),
                          InkWell(
                            onTap: () {
                              //  Get.off(ChooseSignUpPage());
                            },
                            child: Text(
                              "Sign up",
                              style: AppTextStyles.textStyleBoldBodyMedium
                                  .copyWith(
                                      decoration: TextDecoration.underline,
                                      color: AppColor.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (controller.loading.isTrue) LoadingWidget(),
              ],
            );
          }),
    );
  }
}
