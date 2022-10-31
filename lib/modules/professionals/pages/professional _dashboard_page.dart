import 'package:daryaft_flutter/common/loading_widget.dart';
import 'package:daryaft_flutter/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../common/app_pop_ups.dart';
import '../controllers/professional_dashboard_controller.dart';

class ProfessionalDashboardPage
    extends GetView<ProfessionalDashboardController> {
  const ProfessionalDashboardPage({Key? key}) : super(key: key);
  static const id = '/TravelersDashboardPage';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await AppPopUps.showConfirmDialog(
                title: 'Confirm',
                message: 'Are you sure to exit from the app',
                onSubmit: () {
                  Navigator.pop(context, true);
                }) ??
            false;
      },
      child: GetX<ProfessionalDashboardController>(
          initState: (state) {},
          builder: (_) {
            return Stack(
              children: [
                Scaffold(
                  body: SafeArea(
                    child: Stack(
                      children: [
                        Text(
                          'Welcome Professionals',
                          style: AppTextStyles.textStyleBoldBodyMedium
                              .copyWith(color: AppColor.blackColor.value),
                        )
                      ],
                    ),
                  ),
                ),
                if (controller.isLoading.value) LoadingWidget(),
              ],
            );
          }),
    );
  }
}
