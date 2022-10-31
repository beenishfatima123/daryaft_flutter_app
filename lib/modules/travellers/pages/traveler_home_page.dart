import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/loading_widget.dart';
import '../controllers/traveler_home_controller.dart';

class TravelerHomePage extends GetView<TravelerHomeController> {
  const TravelerHomePage({Key? key}) : super(key: key);
  static const id = '/TravelerHomePage';

  @override
  Widget build(BuildContext context) {
    return GetX<TravelerHomeController>(
      initState: (state) {},
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Center(child: Text("History")),
                if (controller.isLoading.isTrue) LoadingWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
