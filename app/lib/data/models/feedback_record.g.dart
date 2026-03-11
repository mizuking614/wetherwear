// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackRecordImpl _$$FeedbackRecordImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackRecordImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      outfitAdvice: json['outfitAdvice'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      apparentTemp: (json['apparentTemp'] as num).toDouble(),
      feedback: $enumDecode(_$FeedbackTypeEnumMap, json['feedback']),
    );

Map<String, dynamic> _$$FeedbackRecordImplToJson(
  _$FeedbackRecordImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date.toIso8601String(),
  'outfitAdvice': instance.outfitAdvice,
  'temperature': instance.temperature,
  'apparentTemp': instance.apparentTemp,
  'feedback': _$FeedbackTypeEnumMap[instance.feedback]!,
};

const _$FeedbackTypeEnumMap = {
  FeedbackType.tooHot: 'tooHot',
  FeedbackType.justRight: 'justRight',
  FeedbackType.tooCold: 'tooCold',
};
