import './parameter.dart';

class WeatherElementTime {
  String startTime;
  String endTime;
  WeatherElementTimeParameter parameter;

  WeatherElementTime({
    required this.startTime,
    required this.endTime,
    required this.parameter,
  });

  // 迭代 -> 從上層處理完此層往下傳遞繼續處理
  factory WeatherElementTime.fromJson(Map<String, dynamic> json) {
    return WeatherElementTime(
      startTime: json['startTime'],
      endTime: json['endTime'],
      parameter: WeatherElementTimeParameter.fromJson(json['parameter']),
    );
  }
}
