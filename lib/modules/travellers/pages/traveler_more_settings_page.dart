import 'package:daryaft_flutter/modules/travellers/controllers/traveler_more_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/loading_widget.dart';
import '../controllers/traveler_home_controller.dart';

class TravelerMoreSettingsPage extends GetView<TravelerMoreSettingsController> {
  const TravelerMoreSettingsPage({Key? key}) : super(key: key);
  static const id = '/TravelerMoreSettingsPage';

  @override
  Widget build(BuildContext context) {
    return GetX<TravelerMoreSettingsController>(
      initState: (state) {},
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Center(child: Text("More settings")),
                if (controller.isLoading.isTrue) LoadingWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
