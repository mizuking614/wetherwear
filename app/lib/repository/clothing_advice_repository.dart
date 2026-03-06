import '../data/models/weather.dart';
import '../data/models/user_config.dart';

abstract class ClothingAdviceRepository {
  Future<String> getAdvice({
    required WeatherData weather,
    required UserConfig config,
  });
}
