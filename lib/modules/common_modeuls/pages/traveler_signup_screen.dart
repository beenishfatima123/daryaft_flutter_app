import 'dart:io';

import 'package:daryaft_flutter/common/extension.dart';
import 'package:daryaft_flutter/common/loading_widget.dart';
import 'package:daryaft_flutter/common/spaces_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/app_utils.dart';
import '../../../common/common_widgets.dart';
import '../../../common/helpers.dart';
import '../../../common/styles.dart';
import '../controller/traveler_signup_controller.dart';

class TravelerSignUpPage extends GetView<TravelerSignupController> {
  static const id = '/TravelerSignUpPage';

  TravelerSignUpPage({Key? key}) : super(key: key);

//  DriverUserModel? driverUserModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
          return Future.value(true);
        },
        child: Scaffold(
          appBar: myAppBar(
            title: /*driverUserModel != null
                ? "Update Your Profile"
                :*/
                "Sign Up",
            onBacKTap: () {
              Get.back();
            },
          ),
          backgroundColor: AppColor.whiteColor.value,
          body: SafeArea(
            child: GetX<TravelerSignupController>(
              initState: (state) {
                /* if (driverUserModel != null) {
                  controller.setValuesWithUpdated(driverUserModel!);
                }*/
              },
              builder: (controller) => Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              key: controller.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  vSpace,
                                  vSpace,
                                  GestureDetector(
                                    onTap: () async {
                                      AppUtils.showPicker(
                                        context: context,
                                        onComplete: (File? file) {
                                          if (file != null) {
                                            controller.profileImage.value =
                                                file;
                                          }
                                        },
                                        onBottomSheetClosed: () {},
                                      );
                                    },
                                    child: getImage(),
                                  ),
                                  vSpace,
                                  vSpace,
                                  getTextField(
                                    title: "Name",
                                    controller: controller.firstNameController,
                                    validate: (String? value) =>
                                        value!.trim().isEmpty
                                            ? "Name Required"
                                            : null,
                                  ),
                                  vSpace,
                                  getTextField(
                                      title: "Contact Number",
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(13),
                                      ],
                                      controller:
                                          controller.contactNumberController,
                                      validate: (String? value) =>
                                          value!.toValidPhoneNumber()),
                                  Column(
                                    children: [
                                      vSpace,
                                      getTextField(
                                        title: "Email",
                                        // enabled: driverUserModel == null,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: controller.emailController,
                                        validate: (String? value) =>
                                            value!.toValidEmail(),
                                      ),
                                    ],
                                  ),
                                  vSpace,
                                  getTextField(
                                    title: "Address",
                                    controller: controller.addressController,
                                    validate: (String? value) =>
                                        value!.trim().isEmpty
                                            ? "Address Required"
                                            : null,
                                  ),
                                  //    if (driverUserModel == null)
                                  Column(
                                    children: [
                                      vSpace,
                                      MyTextField(
                                        suffixIconWidet: GestureDetector(
                                            onTap: () {
                                              controller.hidePasswordOne.value =
                                                  !controller
                                                      .hidePasswordOne.value;
                                            },
                                            child: Icon(controller
                                                    .hidePasswordOne.value
                                                ? Icons.remove_red_eye_rounded
                                                : Icons
                                                    .visibility_off_outlined)),
                                        fillColor: AppColor.alphaGrey.value,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        hintText: "Password",
                                        obsecureText:
                                            controller.hidePasswordOne.value,
                                        controller:
                                            controller.passwordController,
                                        validator: (String? value) =>
                                            value!.toValidPassword(),
                                      ),
                                      vSpace,
                                      MyTextField(
                                        suffixIconWidet: GestureDetector(
                                            onTap: () {
                                              controller.hideConfirmPassword
                                                      .value =
                                                  !controller
                                                      .hideConfirmPassword
                                                      .value;
                                            },
                                            child: Icon(controller
                                                    .hideConfirmPassword.value
                                                ? Icons.remove_red_eye_rounded
                                                : Icons
                                                    .visibility_off_outlined)),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        fillColor: AppColor.alphaGrey.value,
                                        hintText: "Confirm Password",
                                        obsecureText: controller
                                            .hideConfirmPassword.value,
                                        controller: controller
                                            .confirmPasswordController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Confirm Password Required";
                                          }
                                          if (value !=
                                              controller
                                                  .passwordController.text) {
                                            return "Password Not Match";
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                  vSpace,
                                  vSpace,

                                  vSpace,
                                  vSpace,
                                  vSpace,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(100.r),
                        child: Button(
                            buttonText: 'Register',
                            textColor: AppColor.whiteColor.value,
                            onTap: () {
                              FocusScope.of(context).unfocus();

                              /*  if (controller.formKey.currentState!.validate()) {
                                if (controller.cnicFrontFile == null &&
                                    driverUserModel?.cnicFrontImageUrl ==
                                        null) {
                                  Get.showSnackbar(Ui.ErrorSnackBar(
                                      message:
                                          "please choose cnic front copy"));
                                } else if (controller.cnicBackFile == null &&
                                    driverUserModel?.cnicBackImageUrl == null) {
                                  Get.showSnackbar(Ui.ErrorSnackBar(
                                      message: "please choose cnic back copy"));
                                } else if (controller.drivingLicenceFile ==
                                        null &&
                                    driverUserModel?.driverLicenceImageUrl ==
                                        null) {
                                  Get.showSnackbar(Ui.ErrorSnackBar(
                                      message:
                                          "please choose your driving licence"));
                                } else if (controller.profileImage == null &&
                                    driverUserModel?.profileImage == null) {
                                  Get.showSnackbar(Ui.ErrorSnackBar(
                                      message:
                                          "please choose your Profile Image"));
                                } else {
                                  if (driverUserModel != null) {
                                    controller.setUser(driverUserModel);
                                  } else {
                                    controller.checkIfAccountAlreadyExists(
                                        complete: () {
                                      controller.setUser(driverUserModel);
                                    });
                                  }
                                }
                              }*/
                            }),
                      )
                    ],
                  ),
                  if (controller.loading.value) LoadingWidget(),
                ],
              ),
            ),
          ),
        ));
  }

  getTextField(
      {required String title,
      required TextEditingController controller,
      keyboardType = TextInputType.text,
      validate,
      bool enabled = true,
      inputFormatters}) {
    return MyTextField(
      fillColor: AppColor.alphaGrey.value,
      hintText: title,
      labelText: title,
      enable: enabled,
      controller: controller,
      keyboardType: keyboardType,
      validator: validate,
      inputFormatters: inputFormatters,
      //     (string) {
      //   if (string == null || string.isEmpty) {
      //     return 'Enter ${title}';
      //   }
      //   return null;
      // },
    );
  }

  Widget getImage() {
    if (controller.profileImage.value != null) {
      return CircleAvatar(
          radius: 80,
          backgroundImage: Image.file(controller.profileImage.value!).image);
      /*} else if (driverUserModel?.profileImage != null) {
      return NetworkCircularImage(
        url: driverUserModel!.profileImage!,
        radius: 80,
      );*/
    } else {
      return const CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/images/place_your_image.png'));
    }
  }
}
