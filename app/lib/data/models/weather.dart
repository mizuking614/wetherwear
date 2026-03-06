class HourlyForecast {
  final DateTime time;
  final double apparentTemp;
  final int weatherCode;

  const HourlyForecast({
    required this.time,
    required this.apparentTemp,
    required this.weatherCode,
  });
}

class WeatherData {
  final double currentTemp;
  final double apparentTemp;
  final double humidity;
  final double windSpeed;
  final int weatherCode;
  final List<HourlyForecast> hourlyForecast;

  const WeatherData({
    required this.currentTemp,
    required this.apparentTemp,
    required this.humidity,
    required this.windSpeed,
    required this.weatherCode,
    required this.hourlyForecast,
  });

  /// 今日の最低体感温度（帰宅時アラート用）
  double get minApparentTemp =>
      hourlyForecast.isEmpty
          ? apparentTemp
          : hourlyForecast
              .map((h) => h.apparentTemp)
              .reduce((a, b) => a < b ? a : b);

  /// 今日の最高体感温度
  double get maxApparentTemp =>
      hourlyForecast.isEmpty
          ? apparentTemp
          : hourlyForecast
              .map((h) => h.apparentTemp)
              .reduce((a, b) => a > b ? a : b);

  /// 寒暖差
  double get temperatureRange => maxApparentTemp - minApparentTemp;

  /// 帰宅アラートが必要か（帰宅時間帯の体感が現在より5°C以上低い）
  bool get needsColdAlert {
    final eveningForecasts = hourlyForecast.where(
      (h) => h.time.hour >= 17 && h.time.hour <= 22,
    );
    if (eveningForecasts.isEmpty) return false;
    final eveningMin = eveningForecasts
        .map((h) => h.apparentTemp)
        .reduce((a, b) => a < b ? a : b);
    return apparentTemp - eveningMin >= 5;
  }
}
