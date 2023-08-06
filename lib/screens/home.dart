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

    return Obx(() {
      return (globalController.selectedLocation.value == "")
          ? LocationPage()
          : const WeatherPage();
    });
  }
}
