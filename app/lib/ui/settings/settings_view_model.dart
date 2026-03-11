import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/user_config.dart';
import '../../repository/user/repository.dart';

part 'settings_view_model.g.dart';

@riverpod
class SettingsViewModel extends _$SettingsViewModel {
  @override
  UserConfig build() => ref.read(userRepositoryProvider.notifier).build();

  void setBasePreference(BodyPreference p) =>
      ref.read(userRepositoryProvider.notifier).setBasePreference(p);

  void setPollenAllergy(bool v) =>
      ref.read(userRepositoryProvider.notifier).setPollenAllergy(v);

  void setColdAlert(bool v) =>
      ref.read(userRepositoryProvider.notifier).setColdAlert(v);

  void setHealthCorrection(bool v) =>
      ref.read(userRepositoryProvider.notifier).setHealthCorrection(v);

  void setDepartureTime(int hour, int minute) =>
      ref.read(userRepositoryProvider.notifier).setDepartureTime(hour, minute);

  void setLunchTime(int hour, int minute) =>
      ref.read(userRepositoryProvider.notifier).setLunchTime(hour, minute);

  void setReturnTime(int hour, int minute) =>
      ref.read(userRepositoryProvider.notifier).setReturnTime(hour, minute);

  void save() => ref.read(userRepositoryProvider.notifier).save();

  void resetConfig() => ref.read(userRepositoryProvider.notifier).resetConfig();
}
