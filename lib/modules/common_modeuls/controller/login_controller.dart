import 'package:daryaft_flutter/modules/common_modeuls/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/user_defaults.dart';
import '../../professionals/pages/professional _dashboard_page.dart';
import '../../travellers/pages/traveler_dashboard_page.dart';

class LoginController extends GetxController {
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  final isObscure = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    loading.value = true;
    if (emailController.text.startsWith('traveler')) {
      ///0 traveler
      UserDefaults.saveUserSession(UserModel(
          id: 1,
          firstName: 'john',
          lastName: 'traveler',
          userType: 0,
          token: 'token ....'));
      Get.toNamed(TravelerDashBoardPage.id);
    } else if (emailController.text.startsWith('professional')) {
      //goto professional
      ///0 traveler
      UserDefaults.saveUserSession(UserModel(
          id: 2,
          firstName: 'john',
          lastName: 'professional',
          userType: 1,
          token: 'token ....'));

      Get.toNamed(ProfessionalDashBoardPage.id);
    }
    loading.value = false;
  }

  void _loginResponse(dynamic value) {}

  void createAdminUser() {}
}
