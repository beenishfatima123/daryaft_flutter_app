import 'package:daryaft_flutter/common/user_defaults.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor with LightThemeColor, DarkThemeColor {
  static RxBool isDark = false.obs;

  AppColor(dark) {
    listenValues();
    isDark.value = dark;
  }

  listenValues() {
    isDark.listen((isDark) async {
      await UserDefaults.setTheme(isDark);
      if (isDark) {
        _setDarkThemeColors();
      } else {
        _setLightThemeColors();
      }
    });
  }

  void _setDarkThemeColors() {
    primaryColor.value = DarkThemeColor.primaryColor;
    primaryBlueDarkColor.value = DarkThemeColor.primaryBlueDarkColor;
    blackColor.value = DarkThemeColor.blackColor;
    greenColor.value = DarkThemeColor.greenColor;
    redColor.value = DarkThemeColor.redColor;
    alphaGrey.value = DarkThemeColor.alphaGrey;
    greyColor.value = DarkThemeColor.greyColor;
    whiteColor.value = DarkThemeColor.whiteColor;
    yellowColor.value = DarkThemeColor.yellowColor;
  }

  void _setLightThemeColors() {
    primaryColor.value = LightThemeColor.primaryColor;
    primaryBlueDarkColor.value = LightThemeColor.primaryBlueDarkColor;
    blackColor.value = LightThemeColor.blackColor;
    greenColor.value = LightThemeColor.greenColor;
    redColor.value = LightThemeColor.redColor;
    alphaGrey.value = LightThemeColor.alphaGrey;
    greyColor.value = LightThemeColor.greyColor;
    whiteColor.value = LightThemeColor.whiteColor;
    yellowColor.value = LightThemeColor.yellowColor;
  }

  ///light theme
  static var primaryColor = LightThemeColor.primaryColor.obs;
  static var primaryBlueDarkColor = LightThemeColor.primaryBlueDarkColor.obs;
  static var blackColor = LightThemeColor.blackColor.obs;
  static var greenColor = LightThemeColor.greenColor.obs;
  static var redColor = LightThemeColor.redColor.obs;
  static var alphaGrey = LightThemeColor.alphaGrey.obs;
  static var whiteColor = LightThemeColor.whiteColor.obs;
  static var greyColor = LightThemeColor.greyColor.obs;
  static var yellowColor = LightThemeColor.yellowColor.obs;
}

mixin LightThemeColor {
  static const primaryColor = Color(0xff014493);
  static const primaryBlueDarkColor = Color(0xff0070cc);
  static const blackColor = Color(0xff1C2340);
  static const greenColor = Color(0xff2CC78C);
  static const redColor = Colors.red;
  static const alphaGrey = Color(0xffe3e2e2);
  static const whiteColor = Colors.white;
  static const greyColor = Color(0x9e444141);
  static const yellowColor = Color(0xffFFC107);
}

mixin DarkThemeColor {
  static const primaryColor = Color(0xff3c647c);
  static const primaryBlueDarkColor = Color(0xff115a94);
  static const blackColor = Color(0xfffffefe);
  static const greenColor = Color(0xff01e890);
  static const redColor = Colors.red;
  static const alphaGrey = Color(0xa00a0707);
  static const whiteColor = Color(0xa0101010);
  static const greyColor = Color(0xa0e6eceb);
  static const yellowColor = Color(0xffccbb00);
}

class AppTextStyles {
  static final _fontBold =
      GoogleFonts.abel(textStyle: TextStyle(fontWeight: FontWeight.bold));
  static final _fontNormal =
      GoogleFonts.abel(textStyle: TextStyle(fontWeight: FontWeight.normal));

  static TextStyle textStyleBoldTitleLarge = _fontBold.copyWith(fontSize: 22);

  static TextStyle textStyleBoldSubTitleLarge =
      _fontBold.copyWith(fontSize: 20);

  static TextStyle textStyleNormalLargeTitle =
      _fontNormal.copyWith(fontSize: 20);

  static TextStyle textStyleBoldBodyMedium = _fontBold.copyWith(fontSize: 16);
  static TextStyle textStyleNormalBodyMedium =
      _fontNormal.copyWith(fontSize: 16);

  static TextStyle textStyleBoldBodySmall = _fontBold.copyWith(fontSize: 14);
  static TextStyle textStyleNormalBodySmall =
      _fontNormal.copyWith(fontSize: 14);

  static TextStyle textStyleBoldBodyXSmall = _fontBold.copyWith(fontSize: 12);
  static TextStyle textStyleNormalBodyXSmall =
      _fontNormal.copyWith(fontSize: 12);
}
