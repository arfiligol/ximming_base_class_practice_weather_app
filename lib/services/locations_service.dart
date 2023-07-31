import 'package:get/get.dart';

import '../controllers/global.dart';
import '../models/weather_record.dart';
import './daos/weather_record_dao.dart';
import './daos/locations_dao.dart';

/*
先查看本地是否有暫存
若無 -> 透過 API 獲取
  API 獲取為 records -> 做迭代處理 -> 取得 [locations]
  將 locations 存進 local storage
*/

class LocationService {
  static Future<List<String>> getLocations() async {
    final GlobalController globalController = Get.find();

    // 從本地獲取
    List<String>? locations = await LocationsDao.getLocations();

    if (locations != null) {
      return locations;

      // 本地找不到，從 API 獲取
    } else {
      List<WeatherRecord> records = await WeatherRecordDao.getWeatherRecords(
          globalController.selectedLocation.value);

      // 取出 locations
      locations = records
          .map<String>((record) => record.locationName)
          .toSet()
          .toList(); // 迭代遍歷 records，取出 locationNames，用 toSet 移除重複值，再轉成 list

      // 交由 dao -> writeLocationsToLocalStorage() 處理
      LocationsDao.postLocations(locations); // 這裡可以寫得更好，甚至做個 error catch 的動作

      // 更改 state:isLoading
      globalController.isLoading.value = false;

      return locations;
    }
  }
}
