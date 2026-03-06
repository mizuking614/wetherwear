import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/user_config.dart';
import '../../providers.dart';

class SettingsViewModel extends Notifier<UserConfig> {
  @override
  UserConfig build() {
    final repo = ref.read(userRepositoryProvider);
    return repo.loadConfig();
  }

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

  void _save() {
    final repo = ref.read(userRepositoryProvider);
    repo.saveConfig(state);
  }
}

final settingsViewModelProvider =
    NotifierProvider<SettingsViewModel, UserConfig>(SettingsViewModel.new);
