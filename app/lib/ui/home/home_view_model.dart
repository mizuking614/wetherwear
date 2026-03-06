import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/weather.dart';
import '../../data/models/feedback_record.dart';
import '../../providers.dart';

class HomeState {
  final WeatherData? weather;
  final String? advice;
  final bool isLoading;
  final String? error;

  const HomeState({
    this.weather,
    this.advice,
    this.isLoading = false,
    this.error,
  });

  HomeState copyWith({
    WeatherData? weather,
    String? advice,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      weather: weather ?? this.weather,
      advice: advice ?? this.advice,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() => const HomeState();

  Future<void> loadWeatherAndAdvice() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final weatherRepo = ref.read(weatherRepositoryProvider);
      final weather = await weatherRepo.getWeather();

      final userRepo = ref.read(userRepositoryProvider);
      final config = userRepo.loadConfig();

      final adviceRepo = ref.read(clothingAdviceRepositoryProvider);
      final advice = await adviceRepo.getAdvice(
        weather: weather,
        config: config,
      );

      state = state.copyWith(
        weather: weather,
        advice: advice,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> submitFeedback(FeedbackType feedback) async {
    final weather = state.weather;
    final advice = state.advice;
    if (weather == null || advice == null) return;

    final record = FeedbackRecord(
      id: DateTime.now().toIso8601String(),
      date: DateTime.now(),
      outfitAdvice: advice,
      temperature: weather.currentTemp,
      apparentTemp: weather.apparentTemp,
      feedback: feedback,
    );

    final userRepo = ref.read(userRepositoryProvider);
    await userRepo.saveFeedbackRecord(record);
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(
  HomeViewModel.new,
);
