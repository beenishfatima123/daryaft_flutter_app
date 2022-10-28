import 'package:daryaft_flutter/modules/professionals/controllers/professional_dashboard_controller.dart';
import 'package:daryaft_flutter/modules/professionals/pages/professional%20_dashboard_page.dart';
import 'package:daryaft_flutter/modules/travellers/pages/travelers%20_dashboard_page.dart';
import 'package:get/get.dart';

import '../login_controller.dart';
import '../login_page.dart';
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
  ];
}
