/*
透過 WeatherRecordDao 取得 List<WeatherRecord>
回傳 List<WeatherRecord>
*/

import '../models/weather_record.dart';
import './daos/weather_record_dao.dart';

class WeatherRecordService {
  //
  static Future<WeatherRecord> getWeatherRecords(
      String? selectedLocation) async {
    List<WeatherRecord> records =
        await WeatherRecordDao.getWeatherRecords(selectedLocation);

    return records[0];
  }
}
