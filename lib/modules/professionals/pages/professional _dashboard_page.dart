import 'package:daryaft_flutter/modules/professionals/pages/professional_bookings_page.dart';
import 'package:daryaft_flutter/modules/professionals/pages/professional_home_page.dart';
import 'package:daryaft_flutter/modules/professionals/pages/professional_more_settings_page.dart';
import 'package:daryaft_flutter/modules/professionals/pages/professional_services_packages_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../common/app_pop_ups.dart';
import '../../../common/styles.dart';
import '../controllers/professional_dashboard_controller.dart';

class ProfessionalDashBoardPage
    extends GetView<ProfessionalDashboardController> {
  RxInt _selectedIndex = 0.obs;
  static const id = '/ProfessionalDashBoardPage';

  ProfessionalDashBoardPage({super.key});

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
      child: Scaffold(
        backgroundColor: AppColor.whiteColor.value,
        body: SafeArea(
          child: Obx(() {
            _selectedIndex.value;
            return Stack(
              children: [
                IndexedStack(
                    index: _selectedIndex.value, children: _widgetOptions),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColor.blackColor.value,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Colors.black.withOpacity(.1),
                        )
                      ],
                    ),
                    child: SafeArea(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8),
                        child: GNav(
                          rippleColor: AppColor.alphaGrey.value,
                          hoverColor: AppColor.alphaGrey.value,
                          gap: 8,
                          activeColor: AppColor.whiteColor.value,
                          iconSize: 24,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 12),
                          duration: const Duration(milliseconds: 400),
                          tabBackgroundColor:
                              AppColor.primaryColor.value.withOpacity(0.5),
                          color: AppColor.whiteColor.value,
                          backgroundColor: AppColor.blackColor.value,
                          tabs: const [
                            GButton(
                              icon: Icons.home,
                              text: 'Home',
                            ),
                            GButton(
                              icon: Icons.design_services,
                              text: 'Services',
                            ),
                            GButton(
                              icon: Icons.add_chart,
                              text: 'Bookings',
                            ),
                            GButton(
                              icon: Icons.more_horiz,
                              text: 'More',
                            ),
                          ],
                          selectedIndex: _selectedIndex.value,
                          onTabChange: (index) {
                            _selectedIndex.value = index;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const ProfessionalHomePage(),
    ProfessionalServicesPackagePage(),
    const ProfessionalBookingPage(),
    const ProfessionalMoreSettingsPage(),
  ];
}
