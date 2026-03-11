import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/feedback_record.dart';
import '../../data/models/user_config.dart';
import '../../data/sources/local_storage_service.dart';

part 'repository.g.dart';

@riverpod
class UserRepository extends _$UserRepository {
  @override
  UserConfig build() => ref.read(localStorageServiceProvider).loadUserConfig();

  void setBasePreference(BodyPreference p) {
    state = state.copyWith(basePreference: p);
    _save();
  }

  void setPollenAllergy(bool v) {
    state = state.copyWith(hasPollenAllergy: v);
    _save();
  }

  void setColdAlert(bool v) {
    state = state.copyWith(coldAlertEnabled: v);
    _save();
  }

  void setHealthCorrection(bool v) {
    state = state.copyWith(healthCorrectionEnabled: v);
    _save();
  }

  void setDepartureTime(int hour, int minute) {
    state = state.copyWith(departureHour: hour, departureMinute: minute);
  }

  void setLunchTime(int hour, int minute) {
    state = state.copyWith(lunchHour: hour, lunchMinute: minute);
  }

  void setReturnTime(int hour, int minute) {
    state = state.copyWith(returnHour: hour, returnMinute: minute);
  }

  void save() => _save();

  void resetConfig() {
    state = const UserConfig();
    _save();
  }

  List<FeedbackRecord> loadFeedbackRecords() =>
      ref.read(localStorageServiceProvider).loadFeedbackRecords();

  Future<void> saveFeedbackRecord(FeedbackRecord record) =>
      ref.read(localStorageServiceProvider).saveFeedbackRecord(record);

  void _save() {
    ref.read(localStorageServiceProvider).saveUserConfig(state);
  }
}
