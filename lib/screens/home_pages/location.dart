import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/global.dart';
import './weather.dart';

/// Represents the location selection page of the application.
///
/// This page displays a grid of locations and allows the user to select one.
/// Upon selection, the user is navigated to the weather page for the selected location.
class LocationPage extends StatelessWidget {
  /// Creates a location page.
  ///
  /// [key] is an optional parameter used for controlling the framework's widget
  /// tree. It is passed to the superclass.
  LocationPage({Key? key}) : super(key: key);

  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    // Retrieve the locations
    List<String> locations = globalController.locations;

    return Scaffold(
        appBar: AppBar(title: const Text("請選擇地區")),
        body: GridView.builder(
            itemCount: locations.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  3, // Defines the number of blocks to display per row
            ),
            itemBuilder: (BuildContext context, int index) {
              return MouseRegion(
                cursor: SystemMouseCursors
                    .click, // Changes the cursor shape to a click icon when hovered
                child: InkWell(
                  onTap: () {
                    // Handles the user's tap on a location block
                    print('User tapped on location: ${locations[index]}');
                    globalController.selectedLocation.value = locations[index];
                    Get.to(WeatherPage());
                  },
                  child: Card(
                    child: Center(
                      child: Text(locations[index]),
                    ),
                  ),
                ),
              );
            }));
  }
}
