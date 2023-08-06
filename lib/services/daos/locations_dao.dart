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
    // location 只是一個字串陣列
    // 建立與 shared_preferences 溝通的客戶端物件
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    // Set the cache key for the location index
    String cacheKey = "locations";

    // query local storage
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
    // 建立與 shared_preferences 溝通的客戶端物件
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    // Set the cache key for the location index
    String cacheKey = "locations";

    _prefs.setStringList(cacheKey, locations);
  }
}
