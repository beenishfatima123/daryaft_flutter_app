import 'package:daryaft_flutter/modules/common_modeuls/pages/login_page.dart';
import 'package:daryaft_flutter/modules/professionals/pages/professional%20_dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/styles.dart';
import 'common/user_defaults.dart';

import 'modules/common_modeuls/models/user_model.dart';
import 'modules/travellers/pages/traveler_dashboard_page.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      gotoRelevantScreenOnUserType();
    });
  }

  void gotoRelevantScreenOnUserType() async {
    // UserDefaults.clearAll();
    UserModel? user = UserDefaults.getUserSession();
    if ((user != null) && (UserDefaults.getApiToken() != null)) {
      print("user type= ${user.userType}");
      if (user.userType == 0) {
        ///travelers
        Get.toNamed(TravelerDashBoardPage.id);
      } else if (user.userType == 1) {
        ///professionals
        Get.toNamed(ProfessionalDashBoardPage.id);
      } else {
        UserDefaults.clearAll();
        Get.offNamed(LoginPage.id);
      }
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
            color: AppColor.greenColor.value,
          ) /*Image.asset("assets/images/logo.png")*/,
        ),
      ),
    );
  }
}
