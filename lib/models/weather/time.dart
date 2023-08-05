import './parameter.dart';

/// Represents a weather element time, including start time, end time, and associated parameters.
class WeatherElementTime {
  /// The start time of the weather element, typically represented in a specific date-time format.
  String startTime;

  /// The end time of the weather element, typically represented in a specific date-time format.
  String endTime;

  /// The associated weather element time parameter, containing details such as name, value, and unit.
  WeatherElementTimeParameter parameter;

  /// Constructor for creating an instance of the weather element time.
  ///
  /// [startTime], [endTime], and [parameter] are required.
  WeatherElementTime({
    required this.startTime,
    required this.endTime,
    required this.parameter,
  });

  /// Factory constructor to create an instance of weather element time from a JSON object.
  ///
  /// This method iteratively processes the JSON object, handling this layer and then passing it down for further processing.
  ///
  /// [json] is a Map containing the weather element time.
  factory WeatherElementTime.fromJson(Map<String, dynamic> json) {
    return WeatherElementTime(
      startTime: json['startTime'], // Start time
      endTime: json['endTime'], // End time
      parameter: WeatherElementTimeParameter.fromJson(
          json['parameter']), // Associated parameter
    );
  }
}
