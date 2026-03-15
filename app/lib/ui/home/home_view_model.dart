import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/feedback_record.dart';
import '../../data/models/user_config.dart';
import '../../data/models/weather/model.dart';
import '../../repository/clothing_advice/repository.dart';
import '../../repository/user/repository.dart';
import '../../repository/weather/repository.dart';

part 'home_view_model.freezed.dart';
part 'home_view_model.g.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required WeatherData? weather,
    required String? advice,
    required bool isLoading,
    required String? error,
  }) = _HomeState;
}

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() {
    // 初回レンダリング直後にデータを取得する
    Future.microtask(() => loadWeatherAndAdvice());
    return const HomeState(
      weather: null,
      advice: null,
      isLoading: true,
      error: null,
    );
  }

  Future<void> loadWeatherAndAdvice() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final weatherNotifier = ref.read(weatherRepositoryProvider.notifier);
      await weatherNotifier.fetchWeatherFromCurrentLocation();
      final weather = ref.read(weatherRepositoryProvider);
      final userConfig = ref.read(userRepositoryProvider);

      final advice = await ref
          .read(clothingAdviceRepositoryProvider.notifier)
          .getAdvice(weather: weather!, config: userConfig);

      state = state.copyWith(
        weather: weather,
        advice: advice,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> submitFeedback(FeedbackType type) async {
    final weather = state.weather;
    final advice = state.advice;
    if (weather == null || advice == null) return;

    final record = FeedbackRecord(
      id: DateTime.now().toIso8601String(),
      date: DateTime.now(),
      outfitAdvice: advice,
      temperature: weather.currentTemp,
      apparentTemp: weather.apparentTemp,
      feedback: type,
    );

    await ref.read(userRepositoryProvider.notifier).saveFeedbackRecord(record);
  }
}
