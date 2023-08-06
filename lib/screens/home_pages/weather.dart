import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ximming_base_practice_whether_app/components/weather_card.dart';
import 'package:ximming_base_practice_whether_app/controllers/global.dart';

/// Represents the weather page of the application.
///
/// This page displays the weather information for the selected location.
/// The page includes a back button in the AppBar that allows the user to navigate back to the location selection page.
class WeatherPage extends StatelessWidget {
  /// Creates a weather page.
  ///
  /// [key] is an optional parameter used for controlling the framework's widget
  /// tree. It is passed to the superclass.
  WeatherPage({Key? key}) : super(key: key);

  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Display the selected location as the title
          title: Text(globalController.selectedLocation.value),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Clear the selected location and navigate back to the previous page
              globalController.selectedLocation.value = "";
              Get.back(); // Navigate back to the previous page
            },
          ),
        ),
        // Display the weather information
        body: WeatherCard()
        // ...
        );
  }
}
