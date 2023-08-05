import './weather/element.dart';

/// Represents a weather record, including the location name and a list of weather elements.
class WeatherRecord {
  /// The name of the location for which the weather record is applicable.
  String locationName;

  /// A list of weather elements associated with the location.
  List<WeatherElement> weatherElement;

  /// Constructor for creating an instance of the weather record.
  ///
  /// [locationName] and [weatherElement] are required.
  WeatherRecord({
    required this.locationName,
    required this.weatherElement,
  });

  /// Factory constructor to create an instance of weather record from a JSON object.
  ///
  /// This method iteratively processes the JSON object, converting each "weatherElement" into a Dart class and combining them into a list.
  ///
  /// [json] is a Map containing the weather record.
  factory WeatherRecord.fromJson(Map<String, dynamic> json) {
    print(json); // Debugging line to print the JSON object
    return WeatherRecord(
        locationName: json['locationName'], // Location name
        weatherElement: json['weatherElement'] // A list of "weatherElement"
            .map<WeatherElement>(
                (element) => // Convert to Dart class iteratively
                    WeatherElement.fromJson(element))
            .toList()); // Combine all the weather elements into a list
  }
}
