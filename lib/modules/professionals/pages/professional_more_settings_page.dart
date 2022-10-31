import 'package:daryaft_flutter/modules/travellers/controllers/traveler_more_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/loading_widget.dart';
import '../controllers/professional_home_controller.dart';
import '../controllers/professional_more_settings_controller.dart';

class ProfessionalMoreSettingsPage
    extends GetView<TravelerMoreSettingsController> {
  const ProfessionalMoreSettingsPage({Key? key}) : super(key: key);
  static const id = '/ProfessionalMoreSettingsPage';

  @override
  Widget build(BuildContext context) {
    return GetX<ProfessionalMoreSettingsController>(
      initState: (state) {},
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Center(child: Text("More ProfessionalMoreSettingsController")),
                if (controller.isLoading.isTrue) LoadingWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}