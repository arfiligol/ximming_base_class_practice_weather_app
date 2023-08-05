import 'package:get/get.dart';

import '../controllers/global.dart';
import '../models/weather_record.dart';
import './daos/weather_record_dao.dart';
import './daos/locations_dao.dart';

/// Service class for managing locations.
/// It provides methods to retrieve locations either from local storage or through an API.
class LocationService {
  /// Retrieves a list of locations.
  ///
  /// The process includes:
  /// - Checking local storage for cached locations.
  /// - If not found in local storage, fetching from the API.
  /// - Iteratively processing the records to extract locations.
  /// - Storing the locations in local storage.
  /// - Updating the loading state.
  ///
  /// Returns a Future that completes with a list of locations.
  static Future<List<String>> getLocations() async {
    final GlobalController globalController = Get.find();

    // Retrieve locations from local storage
    List<String>? locations = await LocationsDao.getLocations();

    if (locations != null) {
      return locations;

      // If not found locally, fetch from the API
    } else {
      List<WeatherRecord> records = await WeatherRecordDao.getWeatherRecords(
          globalController.selectedLocation.value);

      // Extract locations from the records
      locations = records
          .map<String>((record) => record.locationName)
          .toSet()
          .toList(); // Iterate through records, extract location names, remove duplicates with toSet, and convert to a list

      // Delegate to DAO to write locations to local storage
      LocationsDao.postLocations(
          locations); // This could be improved with error handling

      // Update the loading state
      globalController.isLoading.value = false;

      return locations;
    }
  }
}
