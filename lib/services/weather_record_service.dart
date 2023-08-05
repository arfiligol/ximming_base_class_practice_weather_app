import '../models/weather_record.dart';
import './daos/weather_record_dao.dart';

/// Service class for managing weather records.
/// It provides a method to retrieve a weather record for a given location.
class WeatherRecordService {
  /// Retrieves a weather record for a given location.
  ///
  /// [selectedLocation] is the location for which the weather record is to be retrieved.
  ///
  /// The process includes:
  /// - Calling the WeatherRecordDao to get a list of weather records.
  /// - Returning the first weather record from the list since we need only single location.
  ///
  /// Returns a Future that completes with a weather record.
  static Future<WeatherRecord> getWeatherRecords(
      String? selectedLocation) async {
    List<WeatherRecord> records =
        await WeatherRecordDao.getWeatherRecords(selectedLocation);

    return records[0]; // Return the first weather record
  }
}
