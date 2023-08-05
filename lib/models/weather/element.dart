import './time.dart';

/// Represents a weather element, containing information about a specific
/// weather attribute, such as temperature, humidity, etc.
///
/// Each weather element consists of a name and a list of time-related
/// weather data.
class WeatherElement {
  /// The name of the weather element, e.g., "Temperature".
  String elementName;

  /// A list of [WeatherElementTime] objects, representing the weather
  /// data at different times.
  List<WeatherElementTime> time;

  /// Creates a [WeatherElement] with the given [elementName] and [time].
  WeatherElement({
    required this.elementName,
    required this.time,
  });

  /// Creates a [WeatherElement] from a JSON object.
  ///
  /// The [json] parameter must contain the keys 'elementName' and 'time',
  /// where 'time' is a list of JSON objects that can be converted to
  /// [WeatherElementTime] instances.
  factory WeatherElement.fromJson(Map<String, dynamic> json) {
    return WeatherElement(
        elementName: json['elementName'],
        time: json['time']
            .map<WeatherElementTime>(
                (time) => WeatherElementTime.fromJson(time))
            .toList());
  }
}
