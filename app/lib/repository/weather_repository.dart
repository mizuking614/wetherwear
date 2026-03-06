import '../data/models/weather/model.dart';

abstract class WeatherRepository {
  Future<WeatherData> getWeather();
}
