import 'package:app/repository/weather/repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/weather/model.dart';

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
  Future<HomeState> build() async {
    final weatherNotifier = ref.read(weatherRepositoryProvider.notifier);
    await weatherNotifier.fetchWeather(latitude: 35.6895, longitude: 139.6917);
    // fetchWeather は void を返すので、結果は repository の state から取得する
    final weather = ref.read(weatherRepositoryProvider);
    return HomeState(
      weather: weather,
      advice: null,
      isLoading: false,
      error: null,
    );
  }
}
