import 'package:shared_preferences/shared_preferences.dart';

/*

locations -> ["地名1", "地名2", "地名3", ...]

getLocations()
=> 從 local storage 取得資料

postLocations() *-> 其實用不到
=> 將資料存進 local storage

*/

class LocationsDao {
  // get
  static Future<List<String>?> getLocations() async {
    // location 只是一個字串陣列
    // 建立與 shared_preferences 溝通的客戶端物件
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // 設定 Cache 位置的索引
    String cacheKey = "locations";

    // query local storage
    List<String>? locations = prefs.getStringList(cacheKey);

    if (locations != null) {
      return locations;
    } else {
      return null;
    }
  }

  // post
  static void postLocations(List<String> locations) async {
    // 建立與 shared_preferences 溝通的客戶端物件
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // 設定 Cache 位置的索引
    String cacheKey = "locations";

    prefs.setStringList(cacheKey, locations);
  }
}
