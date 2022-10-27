import 'package:daryaft_flutter/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/styles.dart';
import 'common/user_defaults.dart';

class SplashScreen extends StatefulWidget {
  static const id = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    gotoRelevantScreenOnUserType();
  }

  void gotoRelevantScreenOnUserType() async {
    if ((UserDefaults.getUserSession() != null) &&
        (UserDefaults.getApiToken() != null)) {
      //  Get.offNamed(DashboardPage.id);
    } else {
      Get.offNamed(LoginPage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Icon(
            Icons.ac_unit_outlined,
            size: 50,
            color: AppColor.greenColor,
          ) /*Image.asset("assets/images/logo.png")*/,
        ),
      ),
    );
  }
}
