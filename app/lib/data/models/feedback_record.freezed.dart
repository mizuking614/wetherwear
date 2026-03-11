// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FeedbackRecord _$FeedbackRecordFromJson(Map<String, dynamic> json) {
  return _FeedbackRecord.fromJson(json);
}

/// @nodoc
mixin _$FeedbackRecord {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get outfitAdvice => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  double get apparentTemp => throw _privateConstructorUsedError;
  FeedbackType get feedback => throw _privateConstructorUsedError;

  /// Serializes this FeedbackRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackRecordCopyWith<FeedbackRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackRecordCopyWith<$Res> {
  factory $FeedbackRecordCopyWith(
    FeedbackRecord value,
    $Res Function(FeedbackRecord) then,
  ) = _$FeedbackRecordCopyWithImpl<$Res, FeedbackRecord>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    String outfitAdvice,
    double temperature,
    double apparentTemp,
    FeedbackType feedback,
  });
}

/// @nodoc
class _$FeedbackRecordCopyWithImpl<$Res, $Val extends FeedbackRecord>
    implements $FeedbackRecordCopyWith<$Res> {
  _$FeedbackRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? outfitAdvice = null,
    Object? temperature = null,
    Object? apparentTemp = null,
    Object? feedback = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            outfitAdvice: null == outfitAdvice
                ? _value.outfitAdvice
                : outfitAdvice // ignore: cast_nullable_to_non_nullable
                      as String,
            temperature: null == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as double,
            apparentTemp: null == apparentTemp
                ? _value.apparentTemp
                : apparentTemp // ignore: cast_nullable_to_non_nullable
                      as double,
            feedback: null == feedback
                ? _value.feedback
                : feedback // ignore: cast_nullable_to_non_nullable
                      as FeedbackType,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FeedbackRecordImplCopyWith<$Res>
    implements $FeedbackRecordCopyWith<$Res> {
  factory _$$FeedbackRecordImplCopyWith(
    _$FeedbackRecordImpl value,
    $Res Function(_$FeedbackRecordImpl) then,
  ) = __$$FeedbackRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    String outfitAdvice,
    double temperature,
    double apparentTemp,
    FeedbackType feedback,
  });
}

/// @nodoc
class __$$FeedbackRecordImplCopyWithImpl<$Res>
    extends _$FeedbackRecordCopyWithImpl<$Res, _$FeedbackRecordImpl>
    implements _$$FeedbackRecordImplCopyWith<$Res> {
  __$$FeedbackRecordImplCopyWithImpl(
    _$FeedbackRecordImpl _value,
    $Res Function(_$FeedbackRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedbackRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? outfitAdvice = null,
    Object? temperature = null,
    Object? apparentTemp = null,
    Object? feedback = null,
  }) {
    return _then(
      _$FeedbackRecordImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        outfitAdvice: null == outfitAdvice
            ? _value.outfitAdvice
            : outfitAdvice // ignore: cast_nullable_to_non_nullable
                  as String,
        temperature: null == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as double,
        apparentTemp: null == apparentTemp
            ? _value.apparentTemp
            : apparentTemp // ignore: cast_nullable_to_non_nullable
                  as double,
        feedback: null == feedback
            ? _value.feedback
            : feedback // ignore: cast_nullable_to_non_nullable
                  as FeedbackType,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackRecordImpl implements _FeedbackRecord {
  const _$FeedbackRecordImpl({
    required this.id,
    required this.date,
    required this.outfitAdvice,
    required this.temperature,
    required this.apparentTemp,
    required this.feedback,
  });

  factory _$FeedbackRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackRecordImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String outfitAdvice;
  @override
  final double temperature;
  @override
  final double apparentTemp;
  @override
  final FeedbackType feedback;

  @override
  String toString() {
    return 'FeedbackRecord(id: $id, date: $date, outfitAdvice: $outfitAdvice, temperature: $temperature, apparentTemp: $apparentTemp, feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.outfitAdvice, outfitAdvice) ||
                other.outfitAdvice == outfitAdvice) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.apparentTemp, apparentTemp) ||
                other.apparentTemp == apparentTemp) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    outfitAdvice,
    temperature,
    apparentTemp,
    feedback,
  );

  /// Create a copy of FeedbackRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackRecordImplCopyWith<_$FeedbackRecordImpl> get copyWith =>
      __$$FeedbackRecordImplCopyWithImpl<_$FeedbackRecordImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackRecordImplToJson(this);
  }
}

abstract class _FeedbackRecord implements FeedbackRecord {
  const factory _FeedbackRecord({
    required final String id,
    required final DateTime date,
    required final String outfitAdvice,
    required final double temperature,
    required final double apparentTemp,
    required final FeedbackType feedback,
  }) = _$FeedbackRecordImpl;

  factory _FeedbackRecord.fromJson(Map<String, dynamic> json) =
      _$FeedbackRecordImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get outfitAdvice;
  @override
  double get temperature;
  @override
  double get apparentTemp;
  @override
  FeedbackType get feedback;

  /// Create a copy of FeedbackRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackRecordImplCopyWith<_$FeedbackRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
