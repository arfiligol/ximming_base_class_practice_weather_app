import './weather/element.dart';

class WeatherRecord {
  String locationName;
  List<WeatherElement> weatherElement;

  WeatherRecord({
    required this.locationName,
    required this.weatherElement,
  });

  factory WeatherRecord.fromJson(Map<String, dynamic> json) {
    print(json);
    return WeatherRecord(
        locationName: json['locationName'],
        weatherElement: json['weatherElement'] // a list of "weatherElement"
            .map<WeatherElement>(
                (element) => // convert to dart class iteratively
                    WeatherElement.fromJson(element))
            .toList()); // combine all the weatherElement to a list
  }
}
