import 'package:daryaft_flutter/modules/professionals/controllers/professional_dashboard_controller.dart';
import 'package:daryaft_flutter/modules/professionals/pages/professional%20_dashboard_page.dart';
import 'package:daryaft_flutter/modules/travellers/pages/travelers%20_dashboard_page.dart';
import 'package:get/get.dart';

import '../modules/common_modeuls/controller/login_controller.dart';
import '../modules/common_modeuls/controller/traveler_signup_controller.dart';
import '../modules/common_modeuls/pages/login_page.dart';
import '../modules/common_modeuls/pages/traveler_signup_screen.dart';
import '../modules/travellers/controllers/travelers_dashboard_controller.dart';

appRoutes() {
  return <GetPage>[
    GetPage(
        name: LoginPage.id,
        page: () => LoginPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<LoginController>(() => LoginController());
        })),

    ///professionals dashboard
    GetPage(
        name: ProfessionalDashboardPage.id,
        page: () => const ProfessionalDashboardPage(),
        binding: BindingsBuilder(() {
          Get.put(ProfessionalDashboardController());
        })),

    ///travelers
    GetPage(
        name: TravelersDashboardPage.id,
        page: () => const TravelersDashboardPage(),
        binding: BindingsBuilder(() {
          Get.put(TravelersDashboardController());
        })),

    GetPage(
        name: TravelerSignUpPage.id,
        page: () => TravelerSignUpPage(),
        binding: BindingsBuilder(() {
          Get.put(TravelerSignupController());
        })),
  ];
}
