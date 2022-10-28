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
    return GetX<LoginController>(
        initState: (state) {},
        builder: (_) {
          controller.loading.value;
          return Scaffold(
            backgroundColor: AppColor.whiteColor.value,
            body: Stack(
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
                              color: AppColor.primaryColor.value,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Hero(
                                tag: "logoSigUp",
                                child: Image.asset("assets/images/travel.png",
                                    color: LightThemeColor.alphaGrey,
                                    height: 300,
                                    width: 200),
                              ),
                            ),
                          ),
                          vSpace,
                          Text('Login to continue',
                              style: AppTextStyles.textStyleBoldSubTitleLarge
                                  .copyWith(color: AppColor.blackColor.value)),
                          vSpace,
                          vSpace,
                          MyTextField(
                              controller: controller.emailController,
                              hintText: "Email",
                              validator: (String? value) =>
                                  value!.toValidEmail()),
                          vSpace,
                          Obx(
                            () => MyTextField(
                              controller: controller.passwordController,
                              suffixIconWidet: GestureDetector(
                                  onTap: () {
                                    controller.isObscure.value =
                                        !controller.isObscure.value;
                                  },
                                  child: Icon(
                                      controller.isObscure.value
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: AppColor.blackColor.value)),
                              hintText: "Password",
                              obsecureText: controller.isObscure.value,
                              validator: (String? value) =>
                                  value!.toValidPassword(),
                            ),
                          ),
                          vSpace,
                          vSpace,
                          Button(
                            buttonText: "Log in",
                            textColor: LightThemeColor.whiteColor,
                            color: AppColor.primaryColor.value,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              AppColor.isDark.toggle();
                              print(AppColor.primaryColor.value);
                              //     controller.createAdminUser();
                              /* if (_formKey.currentState!.validate()) {
                                  controller.login();
                                }*/
                            },
                          ),
                          vSpace,
                          Text(
                            "Don't have an account?",
                            style: AppTextStyles.textStyleNormalBodyMedium
                                .copyWith(color: AppColor.blackColor.value),
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
                                      color: AppColor.primaryColor.value),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (controller.loading.isTrue) LoadingWidget(),
              ],
            ),
          );
        });
  }
}
