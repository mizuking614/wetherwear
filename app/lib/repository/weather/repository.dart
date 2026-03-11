import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/weather/model.dart';
import '../../data/sources/location_service.dart';
import '../../data/sources/weather_api_client.dart';

part 'repository.g.dart';

@riverpod
class WeatherRepository extends _$WeatherRepository {
  @override
  WeatherData? build() => null;

  Future<void> fetchWeather({
    required double latitude,
    required double longitude,
  }) async {
    state = await ref
        .read(weatherApiClientProvider)
        .fetchWeather(latitude: latitude, longitude: longitude);
  }

  /// 現在地を取得してから天気を fetch する
  Future<void> fetchWeatherFromCurrentLocation() async {
    final position = await ref
        .read(locationServiceProvider)
        .getCurrentPosition();
    await fetchWeather(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
