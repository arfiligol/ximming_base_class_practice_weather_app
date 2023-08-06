/// Represents a weather element time parameter.
class WeatherElementTimeParameter {
  /// The name of the parameter, such as "Temperature", "Humidity", etc.
  String parameterName;

  /// The value of the parameter, such as "30", "80%", etc. May be null.
  String? parameterValue;

  /// The unit of the parameter, such as "°C", "%", etc. May be null.
  String? parameterUnit;

  /// Constructor for creating an instance of the weather element time parameter.
  ///
  /// [parameterName] is required, while [parameterValue] and [parameterUnit] are optional.
  WeatherElementTimeParameter({
    required this.parameterName,
    this.parameterValue,
    this.parameterUnit,
  });

  /// Factory constructor to create an instance of weather element time parameter from a JSON object.
  ///
  /// This method is particularly useful for handling nested JSON structures.
  ///
  /// [json] is a Map containing the weather element time parameter.
  factory WeatherElementTimeParameter.fromJson(Map<String, dynamic> json) {
    return WeatherElementTimeParameter(
      parameterName: json['parameterName'], // Parameter name
      parameterValue: json['parameterValue'], // Parameter value
      parameterUnit: json['parameterUnit'], // Parameter unit
    );
  }
}
