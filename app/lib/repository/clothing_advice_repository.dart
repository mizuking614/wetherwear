import '../data/models/weather/model.dart';
import '../data/models/user_config.dart';

abstract class ClothingAdviceRepository {
  Future<String> getAdvice({
    required WeatherData weather,
    required UserConfig config,
  });
}
