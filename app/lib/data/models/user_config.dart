enum BodyPreference { hot, normal, cold }

extension BodyPreferenceExt on BodyPreference {
  String get label {
    switch (this) {
      case BodyPreference.hot:
        return '暑がり';
      case BodyPreference.normal:
        return '標準';
      case BodyPreference.cold:
        return '寒がり';
    }
  }

  /// Geminiプロンプトへの補正説明
  String get description {
    switch (this) {
      case BodyPreference.hot:
        return '暑がりなので、一般的な提案より薄着気味にしてください。';
      case BodyPreference.normal:
        return '体感は標準的です。';
      case BodyPreference.cold:
        return '寒がりなので、一般的な提案より厚着気味にしてください。';
    }
  }

  String get key => name; // 'hot' | 'normal' | 'cold'

  static BodyPreference fromKey(String key) {
    return BodyPreference.values.firstWhere(
      (e) => e.name == key,
      orElse: () => BodyPreference.normal,
    );
  }
}

class UserConfig {
  final BodyPreference basePreference;
  final bool hasPollenAllergy;
  final bool coldAlertEnabled;
  final bool healthCorrectionEnabled;
  final int departureHour;
  final int departureMinute;
  final int lunchHour;
  final int lunchMinute;
  final int returnHour;
  final int returnMinute;

  const UserConfig({
    this.basePreference = BodyPreference.normal,
    this.hasPollenAllergy = false,
    this.coldAlertEnabled = true,
    this.healthCorrectionEnabled = false,
    this.departureHour = 8,
    this.departureMinute = 0,
    this.lunchHour = 12,
    this.lunchMinute = 0,
    this.returnHour = 19,
    this.returnMinute = 0,
  });

  UserConfig copyWith({
    BodyPreference? basePreference,
    bool? hasPollenAllergy,
    bool? coldAlertEnabled,
    bool? healthCorrectionEnabled,
    int? departureHour,
    int? departureMinute,
    int? lunchHour,
    int? lunchMinute,
    int? returnHour,
    int? returnMinute,
  }) {
    return UserConfig(
      basePreference: basePreference ?? this.basePreference,
      hasPollenAllergy: hasPollenAllergy ?? this.hasPollenAllergy,
      coldAlertEnabled: coldAlertEnabled ?? this.coldAlertEnabled,
      healthCorrectionEnabled:
          healthCorrectionEnabled ?? this.healthCorrectionEnabled,
      departureHour: departureHour ?? this.departureHour,
      departureMinute: departureMinute ?? this.departureMinute,
      lunchHour: lunchHour ?? this.lunchHour,
      lunchMinute: lunchMinute ?? this.lunchMinute,
      returnHour: returnHour ?? this.returnHour,
      returnMinute: returnMinute ?? this.returnMinute,
    );
  }
}
