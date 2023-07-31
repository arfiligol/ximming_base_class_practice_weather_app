import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../models/weather_record.dart';

/*
流程：

檢查是否有 authorization_key 在環境變數中
檢查是否有 selectedLocation -> 與 Filter 有關
生成 url
request
jsonDecode
return weather_record

*/

class WeatherRecordDao {
  //
  static Future<List<WeatherRecord>> getWeatherRecords(
      String? selectedLocation) async {
    if (dotenv.env['Authorization_key'] != null) {
      String authorizationKey = dotenv.env['Authorization_key'].toString();

      var url;

      // 檢查是否有 selectedLocation，生成 url
      if (selectedLocation != "") {
        url = Uri.parse(
            "https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=$authorizationKey&locationName=$selectedLocation");
        print(url); // 檢查中文有沒有好好被解析
      } else {
        url = Uri.parse(
            "https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=$authorizationKey");
      }

      // request
      print(url);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // 迭代生成、處理 weather record -> with factory
        List<WeatherRecord> weatherRecords =
            jsonDecode(response.body)['records']['location']
                .map<WeatherRecord>((jsonObject) {
          return WeatherRecord.fromJson(jsonObject);
        }).toList();

        // 回傳 weather records
        return weatherRecords;
      } else {
        print(response.statusCode);
        print(response.body);
        return <WeatherRecord>[]; // 先回傳空陣列
      }
    } else {
      print("No Authorization Key");
      return <WeatherRecord>[]; // 先回傳空陣列
    }
  }
}
