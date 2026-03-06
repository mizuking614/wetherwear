import 'package:app/data/models/weather/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
}
