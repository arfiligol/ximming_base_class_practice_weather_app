import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/global.dart';
import './home_pages/location.dart';
import './home_pages/weather.dart';

/// Represents the home screen of the application.
///
/// This screen conditionally renders either the [LocationPage] or the [WeatherPage]
/// based on the current value of [globalController.selectedLocation].
class HomeScreen extends StatelessWidget {
  /// Creates a home screen.
  ///
  /// [key] is an optional parameter used for controlling the framework's widget
  /// tree. It is passed to the superclass.
  HomeScreen({Key? key}) : super(key: key);

  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // If no location is currently selected, render the LocationPage.
      // Otherwise, render the WeatherPage for the selected location.
      return (globalController.selectedLocation.value == "")
          ? LocationPage()
          : WeatherPage();
    });
  }
}
