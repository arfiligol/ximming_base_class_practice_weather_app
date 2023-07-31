import './time.dart';

class WeatherElement {
  String elementName;
  List<WeatherElementTime> time;

  WeatherElement({
    required this.elementName,
    required this.time,
  });

  factory WeatherElement.fromJson(Map<String, dynamic> json) {
    return WeatherElement(
        elementName: json['elementName'],
        time: json['time']
            .map<WeatherElementTime>(
                (time) => WeatherElementTime.fromJson(time))
            .toList());
  }
}
