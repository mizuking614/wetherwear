import '../data/models/weather.dart';

abstract class WeatherRepository {
  Future<WeatherData> getWeather();
}
