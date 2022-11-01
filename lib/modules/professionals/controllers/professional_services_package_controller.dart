import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/helpers.dart';
import '../models/professionals_packaged_services.dart';

class ProfessionalServicesPackageController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<ProfessionalServiceModel> listOfServices =
      <ProfessionalServiceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getListOfServices();
  }

  void _getListOfServices() async {
    try {
      isLoading.value = true;
      listOfServices.clear();
      printWrapped("Reading professionals services");
      final String response =
          await rootBundle.loadString('assets/professionals_services.json');
      Map<String, dynamic> data =
          await json.decode(response) as Map<String, dynamic>;
      for (Map<String, dynamic> item in data['Services']) {
        listOfServices.add(ProfessionalServiceModel.fromMap(item));
        print(listOfServices.toString());
      }
    } catch (e) {
      printWrapped('Error ::: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
