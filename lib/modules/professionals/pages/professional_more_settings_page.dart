import 'package:daryaft_flutter/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/loading_widget.dart';
import '../../../common/app_pop_ups.dart';
import '../../../common/user_defaults.dart';
import '../../common_modeuls/pages/login_page.dart';
import '../controllers/professional_more_settings_controller.dart';

class ProfessionalMoreSettingsPage
    extends GetView<ProfessionalMoreSettingsController> {
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getRowItem(
                        title: 'Privacy Policy',
                        icon: Icons.privacy_tip_outlined,
                        onTap: () {
                          // Get.toNamed(PrivacyPolicyPage.id);
                        }),
                    getRowItem(
                        title: 'About Us',
                        icon: Icons.info_outline,
                        onTap: () {
                          //   Get.toNamed(AboutUsPage.id);
                        }),
                    getRowItem(
                        title: 'Contact Us',
                        icon: Icons.contact_mail_outlined,
                        onTap: () {
                          //   Get.toNamed(ContactUsPage.id);
                        }),
                    getRowItem(
                        title: 'Sign out',
                        icon: Icons.logout,
                        onTap: () {
                          AppPopUps.showAlertDialog(
                              message: 'Are you sure to logout?',
                              onSubmit: () {
                                UserDefaults.clearAll();
                                Get.offAllNamed(LoginPage.id);
                              });
                        }),
                  ],
                ),
                if (controller.isLoading.isTrue) LoadingWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  getRowItem({required String title, required IconData icon, onTap}) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 35.w,
            ),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.textStyleBoldBodyMedium,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
