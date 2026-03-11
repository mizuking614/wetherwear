import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_record.freezed.dart';
part 'feedback_record.g.dart';

@JsonEnum(valueField: 'key')
enum FeedbackType {
  tooHot('tooHot'),
  justRight('justRight'),
  tooCold('tooCold');

  const FeedbackType(this.key);
  final String key;
}

extension FeedbackTypeExt on FeedbackType {
  String get emoji => switch (this) {
    FeedbackType.tooHot => '🥵',
    FeedbackType.justRight => '👌',
    FeedbackType.tooCold => '🥶',
  };

  String get label => switch (this) {
    FeedbackType.tooHot => '暑かった',
    FeedbackType.justRight => 'ちょうど良い',
    FeedbackType.tooCold => '寒かった',
  };
}

@freezed
abstract class FeedbackRecord with _$FeedbackRecord {
  const factory FeedbackRecord({
    required String id,
    required DateTime date,
    required String outfitAdvice,
    required double temperature,
    required double apparentTemp,
    required FeedbackType feedback,
  }) = _FeedbackRecord;

  factory FeedbackRecord.fromJson(Map<String, dynamic> json) =>
      _$FeedbackRecordFromJson(json);
}
