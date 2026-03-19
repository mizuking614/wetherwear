import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../repository/dio/repository.dart';
import '../models/weather/model.dart';
import '../models/weather/weather_api_response.dart';

part 'weather_api_client.g.dart';

@riverpod
WeatherApiClient weatherApiClient(Ref ref) {
  final apiClient = ref.watch(apicliantProvider);
  return WeatherApiClient(apiClient: apiClient);
}

/// Open-Meteo API（無料・キー不要）から気象データを取得する
class WeatherApiClient {
  static const _endpoint = '/forecast';

  final dynamic _apiClient;

  WeatherApiClient({required dynamic apiClient}) : _apiClient = apiClient;

  Future<WeatherData> fetchWeather({
    required double latitude,
    required double longitude,
  }) async {
    final response = await _apiClient.get(
      _endpoint,
      queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
        'current': [
          'temperature_2m',
          'apparent_temperature',
          'relative_humidity_2m',
          'wind_speed_10m',
          'weather_code',
        ].join(','),
        'hourly': ['apparent_temperature', 'weather_code'].join(','),
        'timezone': 'auto',
        'forecast_days': '1',
      },
    );

    final json = response.data;
    return WeatherApiResponseDto.fromJson(json).toWeatherData();
  }
}
