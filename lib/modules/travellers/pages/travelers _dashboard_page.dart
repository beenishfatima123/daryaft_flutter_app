import 'package:daryaft_flutter/common/loading_widget.dart';
import 'package:daryaft_flutter/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../common/app_pop_ups.dart';
import '../controllers/travelers_dashboard_controller.dart';

class TravelersDashboardPage extends GetView<TravelersDashboardController> {
  const TravelersDashboardPage({Key? key}) : super(key: key);
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
      child: GetX<TravelersDashboardController>(
          initState: (state) {},
          builder: (_) {
            return Stack(
              children: [
                Scaffold(
                  body: SafeArea(
                    child: Stack(
                      children: [
                        Text(
                          'Welcome Traveler',
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
