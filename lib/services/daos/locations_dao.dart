import 'package:shared_preferences/shared_preferences.dart';

/// Data Access Object (DAO) class for managing locations.
/// It provides methods to get and post locations using shared preferences.
class LocationsDao {
  /// Retrieves a list of locations from shared preferences.
  ///
  /// Locations are represented as a list of strings.
  ///
  /// Returns a Future that completes with a list of locations, or null if no locations are found.
  static Future<List<String>?> getLocations() async {
    // Create a client object to communicate with shared_preferences
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    // Set the cache key for the location index
    String cacheKey = "locations";

    // Query local storage for the locations
    List<String>? locations = _prefs.getStringList(cacheKey);

    if (locations != null) {
      return locations;
    } else {
      return null;
    }
  }

  /// Stores a list of locations in shared preferences.
  ///
  /// [locations] is the list of locations to be stored.
  static void postLocations(List<String> locations) async {
    // Create a client object to communicate with shared_preferences
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    // Set the cache key for the location index
    String cacheKey = "locations";

    // Store the locations in shared preferences
    _prefs.setStringList(cacheKey, locations);
  }
}
