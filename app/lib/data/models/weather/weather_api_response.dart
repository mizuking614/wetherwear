import 'package:freezed_annotation/freezed_annotation.dart';

import 'model.dart';

part 'weather_api_response.freezed.dart';
part 'weather_api_response.g.dart';

// ---------------------------------------------------------------------------
// DTOs that mirror the Open-Meteo JSON response structure
// ---------------------------------------------------------------------------

/// `current` ブロック
@freezed
abstract class CurrentWeatherDto with _$CurrentWeatherDto {
  const factory CurrentWeatherDto({
    @JsonKey(name: 'temperature_2m') required double temperature2m,
    @JsonKey(name: 'apparent_temperature') required double apparentTemperature,
    @JsonKey(name: 'relative_humidity_2m') required int relativeHumidity2m,
    @JsonKey(name: 'wind_speed_10m') required double windSpeed10m,
    @JsonKey(name: 'weather_code') required int weatherCode,
  }) = _CurrentWeatherDto;

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherDtoFromJson(json);
}

/// `hourly` ブロック（並列リスト）
@freezed
abstract class HourlyDataDto with _$HourlyDataDto {
  const factory HourlyDataDto({
    required List<String> time,
    @JsonKey(name: 'apparent_temperature')
    required List<double> apparentTemperature,
    @JsonKey(name: 'weather_code') required List<int> weatherCode,
  }) = _HourlyDataDto;

  factory HourlyDataDto.fromJson(Map<String, dynamic> json) =>
      _$HourlyDataDtoFromJson(json);
}

/// API レスポンスのトップレベル
@freezed
abstract class WeatherApiResponseDto with _$WeatherApiResponseDto {
  const factory WeatherApiResponseDto({
    required CurrentWeatherDto current,
    required HourlyDataDto hourly,
  }) = _WeatherApiResponseDto;

  factory WeatherApiResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiResponseDtoFromJson(json);
}

// ---------------------------------------------------------------------------
// DTO → ドメインモデル変換
// ---------------------------------------------------------------------------

extension WeatherApiResponseDtoX on WeatherApiResponseDto {
  WeatherData toWeatherData() {
    final forecasts = List.generate(
      hourly.time.length,
      (i) => HourlyForecast(
        time: DateTime.parse(hourly.time[i]),
        apparentTemp: hourly.apparentTemperature[i],
        weatherCode: hourly.weatherCode[i],
      ),
    );

    return WeatherData(
      currentTemp: current.temperature2m,
      apparentTemp: current.apparentTemperature,
      humidity: current.relativeHumidity2m,
      windSpeed: current.windSpeed10m,
      weatherCode: current.weatherCode,
      hourlyForecast: forecasts,
    );
  }
}
