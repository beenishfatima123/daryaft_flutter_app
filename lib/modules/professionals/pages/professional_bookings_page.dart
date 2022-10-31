import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/loading_widget.dart';
import '../controllers/professional_bookings_controller.dart';
import '../controllers/professional_home_controller.dart';

class ProfessionalBookingPage extends GetView<ProfessionalBookingsController> {
  const ProfessionalBookingPage({Key? key}) : super(key: key);
  static const id = '/ProfessionalBookingsPage';

  @override
  Widget build(BuildContext context) {
    return GetX<ProfessionalBookingsController>(
      initState: (state) {},
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Center(child: Text("Bookings")),
                if (controller.isLoading.isTrue) LoadingWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
