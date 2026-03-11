import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/user_config.dart';
import '../../data/models/weather/model.dart';
import '../../data/sources/gemini_api_client.dart';

part 'repository.g.dart';

@riverpod
class ClothingAdviceRepository extends _$ClothingAdviceRepository {
  @override
  void build() {}

  Future<String> getAdvice({
    required WeatherData weather,
    required UserConfig config,
  }) => ref
      .read(geminiApiClientProvider)
      .generateClothingAdvice(weather: weather, config: config);
}
