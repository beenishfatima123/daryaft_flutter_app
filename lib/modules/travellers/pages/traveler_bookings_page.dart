import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/loading_widget.dart';
import '../controllers/traveler_bookings_controller.dart';
import '../controllers/traveler_home_controller.dart';

class TravelerBookingPage extends GetView<TravelerBookingsController> {
  const TravelerBookingPage({Key? key}) : super(key: key);
  static const id = '/TravelerBookingPage';

  @override
  Widget build(BuildContext context) {
    return GetX<TravelerBookingsController>(
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
