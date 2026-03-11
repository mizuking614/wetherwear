import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_config.freezed.dart';
part 'user_config.g.dart';

@JsonEnum(valueField: 'key')
enum BodyPreference {
  hot('hot'),
  normal('normal'),
  cold('cold');

  const BodyPreference(this.key);
  final String key;
}

extension BodyPreferenceExt on BodyPreference {
  String get label => switch (this) {
    BodyPreference.hot => '暑がり',
    BodyPreference.normal => '標準',
    BodyPreference.cold => '寒がり',
  };

  /// Gemini プロンプトへの補正説明
  String get description => switch (this) {
    BodyPreference.hot => '暑がりなので、一般的な提案より薄着気味にしてください。',
    BodyPreference.normal => '体感は標準的です。',
    BodyPreference.cold => '寒がりなので、一般的な提案より厚着気味にしてください。',
  };
}

@freezed
abstract class UserConfig with _$UserConfig {
  const factory UserConfig({
    @Default(BodyPreference.normal) BodyPreference basePreference,
    @Default(false) bool hasPollenAllergy,
    @Default(true) bool coldAlertEnabled,
    @Default(false) bool healthCorrectionEnabled,
    @Default(8) int departureHour,
    @Default(0) int departureMinute,
    @Default(12) int lunchHour,
    @Default(0) int lunchMinute,
    @Default(19) int returnHour,
    @Default(0) int returnMinute,
  }) = _UserConfig;

  factory UserConfig.fromJson(Map<String, dynamic> json) =>
      _$UserConfigFromJson(json);
}
