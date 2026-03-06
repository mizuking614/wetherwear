import '../data/models/weather/model.dart';
import '../data/models/user_config.dart';
import '../data/sources/gemini_api_client.dart';
import 'clothing_advice_repository.dart';

class ClothingAdviceRepositoryImpl implements ClothingAdviceRepository {
  final GeminiApiClient _geminiClient;

  ClothingAdviceRepositoryImpl(this._geminiClient);

  @override
  Future<String> getAdvice({
    required WeatherData weather,
    required UserConfig config,
  }) => _geminiClient.generateClothingAdvice(weather: weather, config: config);
}
