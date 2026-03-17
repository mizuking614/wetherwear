import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user_config.dart';
import '../models/weather/model.dart';

part 'gemini_api_client.g.dart';

@riverpod
GeminiApiClient geminiApiClient(Ref ref) {
  final apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
  return GeminiApiClient(apiKey: apiKey);
}

class GeminiApiClient {
  final GenerativeModel _model;

  GeminiApiClient({required String apiKey})
    : _model = GenerativeModel(
        model: 'gemini-2.5-flash-lite',
        apiKey: apiKey,
        generationConfig: GenerationConfig(
          temperature: 0.7,
          maxOutputTokens: 300,
        ),
      );

  /// 気象データとユーザー設定から服装アドバイスを生成する
  Future<String> generateClothingAdvice({
    required WeatherData weather,
    required UserConfig config,
  }) async {
    const departureHour = 8;
    const eveningHour = 19;

    HourlyForecast? forecast(int hour) {
      try {
        return weather.hourlyForecast.firstWhere((h) => h.time.hour == hour);
      } catch (_) {
        return null;
      }
    }

    final departure = forecast(departureHour);
    final evening = forecast(eveningHour);

    final prompt =
        '''
あなたはパーソナル服装アドバイザーです。以下の情報をもとに、今日の服装を日本語で簡潔にアドバイスしてください（150文字以内）。

【現在の気象】
- 気温: ${weather.currentTemp.toStringAsFixed(1)}°C
- 体感温度: ${weather.apparentTemp.toStringAsFixed(1)}°C
- 湿度: ${weather.humidity.toStringAsFixed(0)}%
- 風速: ${weather.windSpeed.toStringAsFixed(1)} m/s

【時間帯の予報】
- 出発時 ($departureHour時): 体感${departure?.apparentTemp.toStringAsFixed(1) ?? 'N/A'}°C
- 帰宅時 ($eveningHour時): 体感${evening?.apparentTemp.toStringAsFixed(1) ?? 'N/A'}°C
- 今日の寒暖差: ${weather.temperatureRange.toStringAsFixed(1)}°C

【ユーザー情報】
- 体感タイプ: ${config.basePreference.description}
${config.hasPollenAllergy ? '- 花粉症: あり（必要に応じてマスク・眼鏡を提案してください）' : ''}

アドバイスは「〜がおすすめです」のような自然な日本語で。
${weather.needsColdAlert ? '帰宅時の冷え込みについて必ず触れてください。' : ''}
''';

    // TODO: APIクォータが解決したら下のコメントアウトを外す
    try {
      final response = await _model.generateContent([Content.text(prompt)]);
      return response.text ?? '本日の服装アドバイスを取得できませんでした。';
    } catch (e) {
      throw Exception('Gemini APIエラー: $e');
    }
  }
}
