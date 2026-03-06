import '../data/models/weather/model.dart';
import '../data/sources/location_service.dart';
import '../data/sources/weather_api_client.dart';
import 'weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final LocationService _locationService;
  final WeatherApiClient _apiClient;

  WeatherRepositoryImpl({
    required LocationService locationService,
    required WeatherApiClient apiClient,
  }) : _locationService = locationService,
       _apiClient = apiClient;

  @override
  Future<WeatherData> getWeather() async {
    final position = await _locationService.getCurrentPosition();
    return _apiClient.fetchWeather(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
