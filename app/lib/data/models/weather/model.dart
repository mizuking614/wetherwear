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

extension WeatherDataX on WeatherData {
  /// 今日の hourly 予報から最高・最低体感温度の差を返す
  double get temperatureRange {
    if (hourlyForecast.isEmpty) return 0;
    final temps = hourlyForecast.map((h) => h.apparentTemp);
    return temps.reduce((a, b) => a > b ? a : b) -
        temps.reduce((a, b) => a < b ? a : b);
  }

  /// 帰宅時（19時）に現在より 8°C 以上冷え込む場合は true
  bool get needsColdAlert {
    try {
      final evening = hourlyForecast.firstWhere((h) => h.time.hour == 19);
      return (apparentTemp - evening.apparentTemp) >= 8;
    } catch (_) {
      return false;
    }
  }
}
