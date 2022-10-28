import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'modules/professionals/pages/professional _dashboard_page.dart';
import 'modules/travellers/pages/travelers _dashboard_page.dart';

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
      Get.toNamed(TravelersDashboardPage.id);
    } else if (emailController.text.startsWith('professional')) {
      //goto professional
      Get.toNamed(ProfessionalDashboardPage.id);
    }
    loading.value = false;
  }

  void _loginResponse(dynamic value) {}

  void createAdminUser() {}
}
