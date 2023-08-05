import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../models/weather_record.dart';

/// Data Access Object (DAO) class for managing weather records.
/// It provides methods to retrieve weather records based on selected location.
class WeatherRecordDao {
  /// Retrieves a list of weather records for a given location.
  ///
  /// [selectedLocation] is the location for which weather records are to be retrieved.
  ///
  /// The process includes:
  /// - Checking for an authorization key in the environment variables.
  /// - Checking for a selected location (related to filtering).
  /// - Generating the URL for the request.
  /// - Making the HTTP request.
  /// - Decoding the JSON response.
  /// - Returning the weather records.
  ///
  /// Returns a Future that completes with a list of weather records, or an empty list if an error occurs.
  static Future<List<WeatherRecord>> getWeatherRecords(
      String? selectedLocation) async {
    if (dotenv.env['Authorization_key'] != null) {
      String authorizationKey = dotenv.env['Authorization_key'].toString();

      var url;

      // Check for selectedLocation and generate URL
      if (selectedLocation != "") {
        url = Uri.parse(
            "https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=$authorizationKey&locationName=$selectedLocation");
        print(url); // Check if non-English characters are properly parsed
      } else {
        url = Uri.parse(
            "https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=$authorizationKey");
      }

      // Make the HTTP request
      print(url);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // Iteratively generate and process weather records using factory constructor
        List<WeatherRecord> weatherRecords =
            jsonDecode(response.body)['records']['location']
                .map<WeatherRecord>((jsonObject) {
          return WeatherRecord.fromJson(jsonObject);
        }).toList();

        // Return the weather records
        return weatherRecords;
      } else {
        print(response.statusCode);
        print(response.body);
        return <WeatherRecord>[]; // Return an empty list as a fallback
      }
    } else {
      print("No Authorization Key");
      return <WeatherRecord>[]; // Return an empty list as a fallback
    }
  }
}
