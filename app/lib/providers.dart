import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/sources/local_storage_service.dart';
import '../data/sources/location_service.dart';
import '../data/sources/weather_api_client.dart';
import '../data/sources/gemini_api_client.dart';
import '../repository/weather_repository.dart';
import '../repository/weather_repository_impl.dart';
import '../repository/user_repository.dart';
import '../repository/user_repository_impl.dart';
import '../repository/clothing_advice_repository.dart';
import '../repository/clothing_advice_repository_impl.dart';

// ===== SharedPreferences =====

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (_) => throw UnimplementedError('Override in ProviderScope'),
);

// ===== Services =====

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService(ref.read(sharedPreferencesProvider));
});

final locationServiceProvider = Provider<LocationService>(
  (_) => LocationService(),
);

final weatherApiClientProvider = Provider<WeatherApiClient>(
  (_) => WeatherApiClient(),
);

final geminiApiClientProvider = Provider<GeminiApiClient>((ref) {
  const apiKey = String.fromEnvironment(
    'GEMINI_API_KEY',
    defaultValue: '',
  );
  return GeminiApiClient(apiKey: apiKey);
});

// ===== Repositories =====

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepositoryImpl(
    locationService: ref.read(locationServiceProvider),
    apiClient: ref.read(weatherApiClientProvider),
  );
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.read(localStorageServiceProvider));
});

final clothingAdviceRepositoryProvider = Provider<ClothingAdviceRepository>(
  (ref) => ClothingAdviceRepositoryImpl(ref.read(geminiApiClientProvider)),
);
