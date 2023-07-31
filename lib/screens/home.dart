import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/global.dart';
import './home_pages/location.dart';
import './home_pages/weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.find();

    List<String> locations = globalController.locations;
    // 生成 Cards

    return Obx(() {
      return (globalController.selectedLocation.value == "")
          ? LocationPage()
          : WeatherPage();
    });
  }
}
