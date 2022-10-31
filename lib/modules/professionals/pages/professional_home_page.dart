import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/loading_widget.dart';
import '../controllers/professional_home_controller.dart';

class ProfessionalHomePage extends GetView<ProfessionalHomeController> {
  const ProfessionalHomePage({Key? key}) : super(key: key);
  static const id = '/ProfessionalHomePage';

  @override
  Widget build(BuildContext context) {
    return GetX<ProfessionalHomeController>(
      initState: (state) {},
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Center(child: Text("ProfessionalHomeController")),
                if (controller.isLoading.isTrue) LoadingWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
