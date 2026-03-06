import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
abstract class HourlyForecast with _$HourlyForecast {
  const factory HourlyForecast({
    required DateTime time,
    required double apparentTemp,
    required int weatherCode,
  }) = _HourlyForecast;

  factory HourlyForecast.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastFromJson(json);
}

@freezed
abstract class WeatherData with _$WeatherData {
  const factory WeatherData({
    required double currentTemp,
    required double apparentTemp,
    required int humidity,
    required double windSpeed,
    required int weatherCode,
    required List<HourlyForecast> hourlyForecast,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}
