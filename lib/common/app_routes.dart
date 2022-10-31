import 'package:daryaft_flutter/modules/professionals/controllers/professional_dashboard_controller.dart';
import 'package:daryaft_flutter/modules/professionals/pages/professional%20_dashboard_page.dart';
import 'package:daryaft_flutter/modules/travellers/controllers/traveler_home_controller.dart';
import 'package:daryaft_flutter/modules/travellers/controllers/traveler_services_package_controller.dart';
import 'package:get/get.dart';

import '../modules/common_modeuls/controller/login_controller.dart';
import '../modules/common_modeuls/controller/traveler_signup_controller.dart';
import '../modules/common_modeuls/pages/login_page.dart';
import '../modules/common_modeuls/pages/traveler_signup_screen.dart';
import '../modules/travellers/controllers/traveler_bookings_controller.dart';
import '../modules/travellers/controllers/traveler_more_settings_controller.dart';
import '../modules/travellers/controllers/travelers_dashboard_controller.dart';
import '../modules/travellers/pages/traveler_dashboard_page.dart';

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
        name: TravelerDashBoardPage.id,
        page: () => TravelerDashBoardPage(),
        binding: BindingsBuilder(() {
          Get.put(TravelersDashboardController());
          Get.put(TravelerHomeController());
          Get.put(TravelerServicesPackageController());
          Get.put(TravelerBookingsController());
          Get.put(TravelerMoreSettingsController());

          ///add other controllers......
        })),

    GetPage(
        name: TravelerSignUpPage.id,
        page: () => TravelerSignUpPage(),
        binding: BindingsBuilder(() {
          Get.put(TravelerSignupController());
        })),
  ];
}
