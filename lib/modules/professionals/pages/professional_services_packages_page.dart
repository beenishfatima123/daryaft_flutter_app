import 'package:daryaft_flutter/common/app_pop_ups.dart';
import 'package:daryaft_flutter/common/constants.dart';
import 'package:daryaft_flutter/modules/professionals/models/professionals_packaged_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/loading_widget.dart';
import '../../../common/spaces_boxes.dart';
import '../../../common/styles.dart';
import '../controllers/professional_services_package_controller.dart';

class ProfessionalServicesPackagePage
    extends GetView<ProfessionalServicesPackageController> {
  ProfessionalServicesPackagePage({Key? key}) : super(key: key);
  static const id = '/ProfessionalServicesPackagePage';
  late List<Widget> servicesList;
  @override
  Widget build(BuildContext context) {
    return GetX<ProfessionalServicesPackageController>(
      initState: (state) {
        ///
      },
      builder: (_) {
        servicesList = (controller.listOfServices
            .map((element) => getServiceItem(service: element))).toList();
        servicesList.add(addNewServiceWidget());

        ///
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    vSpace,
                    vSpace,
                    Center(
                        child: Text(
                      "Services & Packages",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textStyleBoldTitleLarge
                          .copyWith(color: AppColor.primaryColor.value),
                    )),
                    vSpace,
                    vSpace,
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("SERVICES",
                                  style: AppTextStyles.textStyleBoldBodyMedium),
                              vSpace,
                              Flexible(
                                child: Wrap(
                                  children: servicesList,
                                ),
                              ),
                              vSpace,
                              Text("PACKAGES",
                                  style: AppTextStyles.textStyleBoldBodyMedium),
                              vSpace,
                              Column(
                                children: [
                                  _getPackageWidget(
                                      package: ProfessionalPackagedServices(
                                          title: 'SILVER PACKAGE',
                                          services: controller.listOfServices,
                                          price: '10000',
                                          days: '3',
                                          description:
                                              AppConstants.loreumIpsum))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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

  Widget getServiceItem({required ProfessionalServiceModel service}) {
    return Container(
      height: 50.h,
      margin: const EdgeInsets.all(6),
      width: 120,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColor.primaryColor.value),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Text(service.tag ?? '-',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyles.textStyleBoldBodyMedium.copyWith(
                    color: AppColor.whiteColor.value,
                  )),
            ),
            Icon(Icons.arrow_circle_down_sharp,
                size: 18, color: AppColor.whiteColor.value)
          ],
        ),
      ),
    );
  }

  Widget addNewServiceWidget() {
    return InkWell(
      onTap: () {
        AppPopUps.showOneInputDialog(onSubmit: (text) {
          //  controller.listOfServices.add(item)
        });
      },
      child: Container(
        height: 50.h,
        margin: const EdgeInsets.all(6),
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColor.primaryColor.value),
        child: Center(
            child: Icon(Icons.add_circle_outline,
                size: 18, color: AppColor.whiteColor.value)),
      ),
    );
  }

  Widget _getPackageWidget({required ProfessionalPackagedServices package}) {
    return Card(
      elevation: 8,
      child: Container(
        height: 360.h,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Column(
          children: [
            Text(package.title ?? '-',
                style: AppTextStyles.textStyleBoldBodySmall),
            Text(
                'For ${package.days ?? '-'} days with ${package.price ?? '-'}/person',
                style: AppTextStyles.textStyleNormalBodyXSmall
                    .copyWith(color: AppColor.primaryColor.value)),
            vSpace,
            Flexible(
              child: Text(package.description ?? '',
                  overflow: TextOverflow.fade,
                  style: AppTextStyles.textStyleNormalBodyXSmall),
            ),
            SizedBox(
              height: 50.h,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: package.services.isNotEmpty
                      ? package.services
                          .map((ProfessionalServiceModel e) => Card(
                                color: AppColor.alphaGrey.value,
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Center(
                                      child: Text(
                                    e.tag ?? '',
                                    style: AppTextStyles.textStyleBoldBodyXSmall
                                        .copyWith(
                                            color: AppColor.blackColor.value),
                                  )),
                                ),
                              ))
                          .toList()
                      : []),
            )
          ],
        ),
      ),
    );
  }
}
