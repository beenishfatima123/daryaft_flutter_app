import 'package:daryaft_flutter/modules/travellers/controllers/traveler_services_package_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/loading_widget.dart';
import '../controllers/traveler_more_settings_controller.dart';

class TravelerServicesPackagePage
    extends GetView<TravelerServicesPackageController> {
  const TravelerServicesPackagePage({Key? key}) : super(key: key);
  static const id = '/TravelerServicesPackagePage';

  @override
  Widget build(BuildContext context) {
    return GetX<TravelerServicesPackageController>(
      initState: (state) {},
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Center(child: Text("Services")),
                if (controller.isLoading.isTrue) LoadingWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
