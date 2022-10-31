import 'package:daryaft_flutter/modules/travellers/controllers/traveler_services_package_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/loading_widget.dart';
import '../controllers/professional_more_settings_controller.dart';
import '../controllers/professional_services_package_controller.dart';

class ProfessionalServicesPackagePage
    extends GetView<ProfessionalServicesPackageController> {
  const ProfessionalServicesPackagePage({Key? key}) : super(key: key);
  static const id = '/ProfessionalServicesPackagePage';

  @override
  Widget build(BuildContext context) {
    return GetX<ProfessionalServicesPackageController>(
      initState: (state) {},
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Center(child: Text("ProfessionalServicesPackagePage")),
                if (controller.isLoading.isTrue) LoadingWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
