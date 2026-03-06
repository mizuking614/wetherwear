import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

/// Open-Meteo API（無料・キー不要）から気象データを取得する
class WeatherApiClient {
  static const _baseUrl = 'https://api.open-meteo.com/v1/forecast';

  final http.Client _client;

  WeatherApiClient({http.Client? client}) : _client = client ?? http.Client();

  Future<WeatherData> fetchWeather({
    required double latitude,
    required double longitude,
  }) async {
    final uri = Uri.parse(_baseUrl).replace(
      queryParameters: {
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
        'current': [
          'temperature_2m',
          'apparent_temperature',
          'relative_humidity_2m',
          'wind_speed_10m',
          'weather_code',
        ].join(','),
        'hourly': ['apparent_temperature', 'weather_code'].join(','),
        'timezone': 'Asia/Tokyo',
        'forecast_days': '1',
      },
    );

    final response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw Exception('天気データの取得に失敗しました: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return _parse(json);
  }

  WeatherData _parse(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>;
    final hourly = json['hourly'] as Map<String, dynamic>;

    final times = (hourly['time'] as List).cast<String>();
    final apparentTemps = (hourly['apparent_temperature'] as List)
        .map((e) => (e as num).toDouble())
        .toList();
    final codes = (hourly['weather_code'] as List)
        .map((e) => (e as num).toInt())
        .toList();

    final forecasts = List.generate(
      times.length,
      (i) => HourlyForecast(
        time: DateTime.parse(times[i]),
        apparentTemp: apparentTemps[i],
        weatherCode: codes[i],
      ),
    );

    return WeatherData(
      currentTemp: (current['temperature_2m'] as num).toDouble(),
      apparentTemp: (current['apparent_temperature'] as num).toDouble(),
      humidity: (current['relative_humidity_2m'] as num).toDouble(),
      windSpeed: (current['wind_speed_10m'] as num).toDouble(),
      weatherCode: (current['weather_code'] as num).toInt(),
      hourlyForecast: forecasts,
    );
  }
}
