// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserConfigImpl _$$UserConfigImplFromJson(
  Map<String, dynamic> json,
) => _$UserConfigImpl(
  basePreference:
      $enumDecodeNullable(_$BodyPreferenceEnumMap, json['basePreference']) ??
      BodyPreference.normal,
  hasPollenAllergy: json['hasPollenAllergy'] as bool? ?? false,
  coldAlertEnabled: json['coldAlertEnabled'] as bool? ?? true,
  healthCorrectionEnabled: json['healthCorrectionEnabled'] as bool? ?? false,
  departureHour: (json['departureHour'] as num?)?.toInt() ?? 8,
  departureMinute: (json['departureMinute'] as num?)?.toInt() ?? 0,
  lunchHour: (json['lunchHour'] as num?)?.toInt() ?? 12,
  lunchMinute: (json['lunchMinute'] as num?)?.toInt() ?? 0,
  returnHour: (json['returnHour'] as num?)?.toInt() ?? 19,
  returnMinute: (json['returnMinute'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$UserConfigImplToJson(_$UserConfigImpl instance) =>
    <String, dynamic>{
      'basePreference': _$BodyPreferenceEnumMap[instance.basePreference]!,
      'hasPollenAllergy': instance.hasPollenAllergy,
      'coldAlertEnabled': instance.coldAlertEnabled,
      'healthCorrectionEnabled': instance.healthCorrectionEnabled,
      'departureHour': instance.departureHour,
      'departureMinute': instance.departureMinute,
      'lunchHour': instance.lunchHour,
      'lunchMinute': instance.lunchMinute,
      'returnHour': instance.returnHour,
      'returnMinute': instance.returnMinute,
    };

const _$BodyPreferenceEnumMap = {
  BodyPreference.hot: 'hot',
  BodyPreference.normal: 'normal',
  BodyPreference.cold: 'cold',
};
