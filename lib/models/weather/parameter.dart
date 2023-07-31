class WeatherElementTimeParameter {
  String parameterName;
  String? parameterValue;
  String? parameterUnit;

  WeatherElementTimeParameter({
    required this.parameterName,
    this.parameterValue,
    this.parameterUnit,
  });

  // factory -> 工廠 -> 迭代處理 json 成 dart classes（一但 json 疊層數高的時候，突然覺得好高明的做法）
  factory WeatherElementTimeParameter.fromJson(Map<String, dynamic> json) {
    return WeatherElementTimeParameter(
      parameterName: json['parameterName'],
      parameterValue: json['parameterValue'],
      parameterUnit: json['parameterUnit'],
    );
  }
}
