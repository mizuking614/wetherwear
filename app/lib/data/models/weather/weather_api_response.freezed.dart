// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CurrentWeatherDto _$CurrentWeatherDtoFromJson(Map<String, dynamic> json) {
  return _CurrentWeatherDto.fromJson(json);
}

/// @nodoc
mixin _$CurrentWeatherDto {
  @JsonKey(name: 'temperature_2m')
  double get temperature2m => throw _privateConstructorUsedError;
  @JsonKey(name: 'apparent_temperature')
  double get apparentTemperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'relative_humidity_2m')
  int get relativeHumidity2m => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_speed_10m')
  double get windSpeed10m => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather_code')
  int get weatherCode => throw _privateConstructorUsedError;

  /// Serializes this CurrentWeatherDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrentWeatherDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentWeatherDtoCopyWith<CurrentWeatherDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWeatherDtoCopyWith<$Res> {
  factory $CurrentWeatherDtoCopyWith(
    CurrentWeatherDto value,
    $Res Function(CurrentWeatherDto) then,
  ) = _$CurrentWeatherDtoCopyWithImpl<$Res, CurrentWeatherDto>;
  @useResult
  $Res call({
    @JsonKey(name: 'temperature_2m') double temperature2m,
    @JsonKey(name: 'apparent_temperature') double apparentTemperature,
    @JsonKey(name: 'relative_humidity_2m') int relativeHumidity2m,
    @JsonKey(name: 'wind_speed_10m') double windSpeed10m,
    @JsonKey(name: 'weather_code') int weatherCode,
  });
}

/// @nodoc
class _$CurrentWeatherDtoCopyWithImpl<$Res, $Val extends CurrentWeatherDto>
    implements $CurrentWeatherDtoCopyWith<$Res> {
  _$CurrentWeatherDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentWeatherDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature2m = null,
    Object? apparentTemperature = null,
    Object? relativeHumidity2m = null,
    Object? windSpeed10m = null,
    Object? weatherCode = null,
  }) {
    return _then(
      _value.copyWith(
            temperature2m: null == temperature2m
                ? _value.temperature2m
                : temperature2m // ignore: cast_nullable_to_non_nullable
                      as double,
            apparentTemperature: null == apparentTemperature
                ? _value.apparentTemperature
                : apparentTemperature // ignore: cast_nullable_to_non_nullable
                      as double,
            relativeHumidity2m: null == relativeHumidity2m
                ? _value.relativeHumidity2m
                : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
                      as int,
            windSpeed10m: null == windSpeed10m
                ? _value.windSpeed10m
                : windSpeed10m // ignore: cast_nullable_to_non_nullable
                      as double,
            weatherCode: null == weatherCode
                ? _value.weatherCode
                : weatherCode // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CurrentWeatherDtoImplCopyWith<$Res>
    implements $CurrentWeatherDtoCopyWith<$Res> {
  factory _$$CurrentWeatherDtoImplCopyWith(
    _$CurrentWeatherDtoImpl value,
    $Res Function(_$CurrentWeatherDtoImpl) then,
  ) = __$$CurrentWeatherDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'temperature_2m') double temperature2m,
    @JsonKey(name: 'apparent_temperature') double apparentTemperature,
    @JsonKey(name: 'relative_humidity_2m') int relativeHumidity2m,
    @JsonKey(name: 'wind_speed_10m') double windSpeed10m,
    @JsonKey(name: 'weather_code') int weatherCode,
  });
}

/// @nodoc
class __$$CurrentWeatherDtoImplCopyWithImpl<$Res>
    extends _$CurrentWeatherDtoCopyWithImpl<$Res, _$CurrentWeatherDtoImpl>
    implements _$$CurrentWeatherDtoImplCopyWith<$Res> {
  __$$CurrentWeatherDtoImplCopyWithImpl(
    _$CurrentWeatherDtoImpl _value,
    $Res Function(_$CurrentWeatherDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CurrentWeatherDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature2m = null,
    Object? apparentTemperature = null,
    Object? relativeHumidity2m = null,
    Object? windSpeed10m = null,
    Object? weatherCode = null,
  }) {
    return _then(
      _$CurrentWeatherDtoImpl(
        temperature2m: null == temperature2m
            ? _value.temperature2m
            : temperature2m // ignore: cast_nullable_to_non_nullable
                  as double,
        apparentTemperature: null == apparentTemperature
            ? _value.apparentTemperature
            : apparentTemperature // ignore: cast_nullable_to_non_nullable
                  as double,
        relativeHumidity2m: null == relativeHumidity2m
            ? _value.relativeHumidity2m
            : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
                  as int,
        windSpeed10m: null == windSpeed10m
            ? _value.windSpeed10m
            : windSpeed10m // ignore: cast_nullable_to_non_nullable
                  as double,
        weatherCode: null == weatherCode
            ? _value.weatherCode
            : weatherCode // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentWeatherDtoImpl implements _CurrentWeatherDto {
  const _$CurrentWeatherDtoImpl({
    @JsonKey(name: 'temperature_2m') required this.temperature2m,
    @JsonKey(name: 'apparent_temperature') required this.apparentTemperature,
    @JsonKey(name: 'relative_humidity_2m') required this.relativeHumidity2m,
    @JsonKey(name: 'wind_speed_10m') required this.windSpeed10m,
    @JsonKey(name: 'weather_code') required this.weatherCode,
  });

  factory _$CurrentWeatherDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentWeatherDtoImplFromJson(json);

  @override
  @JsonKey(name: 'temperature_2m')
  final double temperature2m;
  @override
  @JsonKey(name: 'apparent_temperature')
  final double apparentTemperature;
  @override
  @JsonKey(name: 'relative_humidity_2m')
  final int relativeHumidity2m;
  @override
  @JsonKey(name: 'wind_speed_10m')
  final double windSpeed10m;
  @override
  @JsonKey(name: 'weather_code')
  final int weatherCode;

  @override
  String toString() {
    return 'CurrentWeatherDto(temperature2m: $temperature2m, apparentTemperature: $apparentTemperature, relativeHumidity2m: $relativeHumidity2m, windSpeed10m: $windSpeed10m, weatherCode: $weatherCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWeatherDtoImpl &&
            (identical(other.temperature2m, temperature2m) ||
                other.temperature2m == temperature2m) &&
            (identical(other.apparentTemperature, apparentTemperature) ||
                other.apparentTemperature == apparentTemperature) &&
            (identical(other.relativeHumidity2m, relativeHumidity2m) ||
                other.relativeHumidity2m == relativeHumidity2m) &&
            (identical(other.windSpeed10m, windSpeed10m) ||
                other.windSpeed10m == windSpeed10m) &&
            (identical(other.weatherCode, weatherCode) ||
                other.weatherCode == weatherCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    temperature2m,
    apparentTemperature,
    relativeHumidity2m,
    windSpeed10m,
    weatherCode,
  );

  /// Create a copy of CurrentWeatherDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentWeatherDtoImplCopyWith<_$CurrentWeatherDtoImpl> get copyWith =>
      __$$CurrentWeatherDtoImplCopyWithImpl<_$CurrentWeatherDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentWeatherDtoImplToJson(this);
  }
}

abstract class _CurrentWeatherDto implements CurrentWeatherDto {
  const factory _CurrentWeatherDto({
    @JsonKey(name: 'temperature_2m') required final double temperature2m,
    @JsonKey(name: 'apparent_temperature')
    required final double apparentTemperature,
    @JsonKey(name: 'relative_humidity_2m')
    required final int relativeHumidity2m,
    @JsonKey(name: 'wind_speed_10m') required final double windSpeed10m,
    @JsonKey(name: 'weather_code') required final int weatherCode,
  }) = _$CurrentWeatherDtoImpl;

  factory _CurrentWeatherDto.fromJson(Map<String, dynamic> json) =
      _$CurrentWeatherDtoImpl.fromJson;

  @override
  @JsonKey(name: 'temperature_2m')
  double get temperature2m;
  @override
  @JsonKey(name: 'apparent_temperature')
  double get apparentTemperature;
  @override
  @JsonKey(name: 'relative_humidity_2m')
  int get relativeHumidity2m;
  @override
  @JsonKey(name: 'wind_speed_10m')
  double get windSpeed10m;
  @override
  @JsonKey(name: 'weather_code')
  int get weatherCode;

  /// Create a copy of CurrentWeatherDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentWeatherDtoImplCopyWith<_$CurrentWeatherDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HourlyDataDto _$HourlyDataDtoFromJson(Map<String, dynamic> json) {
  return _HourlyDataDto.fromJson(json);
}

/// @nodoc
mixin _$HourlyDataDto {
  List<String> get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'apparent_temperature')
  List<double> get apparentTemperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather_code')
  List<int> get weatherCode => throw _privateConstructorUsedError;

  /// Serializes this HourlyDataDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HourlyDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyDataDtoCopyWith<HourlyDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyDataDtoCopyWith<$Res> {
  factory $HourlyDataDtoCopyWith(
    HourlyDataDto value,
    $Res Function(HourlyDataDto) then,
  ) = _$HourlyDataDtoCopyWithImpl<$Res, HourlyDataDto>;
  @useResult
  $Res call({
    List<String> time,
    @JsonKey(name: 'apparent_temperature') List<double> apparentTemperature,
    @JsonKey(name: 'weather_code') List<int> weatherCode,
  });
}

/// @nodoc
class _$HourlyDataDtoCopyWithImpl<$Res, $Val extends HourlyDataDto>
    implements $HourlyDataDtoCopyWith<$Res> {
  _$HourlyDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourlyDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? apparentTemperature = null,
    Object? weatherCode = null,
  }) {
    return _then(
      _value.copyWith(
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            apparentTemperature: null == apparentTemperature
                ? _value.apparentTemperature
                : apparentTemperature // ignore: cast_nullable_to_non_nullable
                      as List<double>,
            weatherCode: null == weatherCode
                ? _value.weatherCode
                : weatherCode // ignore: cast_nullable_to_non_nullable
                      as List<int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HourlyDataDtoImplCopyWith<$Res>
    implements $HourlyDataDtoCopyWith<$Res> {
  factory _$$HourlyDataDtoImplCopyWith(
    _$HourlyDataDtoImpl value,
    $Res Function(_$HourlyDataDtoImpl) then,
  ) = __$$HourlyDataDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> time,
    @JsonKey(name: 'apparent_temperature') List<double> apparentTemperature,
    @JsonKey(name: 'weather_code') List<int> weatherCode,
  });
}

/// @nodoc
class __$$HourlyDataDtoImplCopyWithImpl<$Res>
    extends _$HourlyDataDtoCopyWithImpl<$Res, _$HourlyDataDtoImpl>
    implements _$$HourlyDataDtoImplCopyWith<$Res> {
  __$$HourlyDataDtoImplCopyWithImpl(
    _$HourlyDataDtoImpl _value,
    $Res Function(_$HourlyDataDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HourlyDataDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? apparentTemperature = null,
    Object? weatherCode = null,
  }) {
    return _then(
      _$HourlyDataDtoImpl(
        time: null == time
            ? _value._time
            : time // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        apparentTemperature: null == apparentTemperature
            ? _value._apparentTemperature
            : apparentTemperature // ignore: cast_nullable_to_non_nullable
                  as List<double>,
        weatherCode: null == weatherCode
            ? _value._weatherCode
            : weatherCode // ignore: cast_nullable_to_non_nullable
                  as List<int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HourlyDataDtoImpl implements _HourlyDataDto {
  const _$HourlyDataDtoImpl({
    required final List<String> time,
    @JsonKey(name: 'apparent_temperature')
    required final List<double> apparentTemperature,
    @JsonKey(name: 'weather_code') required final List<int> weatherCode,
  }) : _time = time,
       _apparentTemperature = apparentTemperature,
       _weatherCode = weatherCode;

  factory _$HourlyDataDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyDataDtoImplFromJson(json);

  final List<String> _time;
  @override
  List<String> get time {
    if (_time is EqualUnmodifiableListView) return _time;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_time);
  }

  final List<double> _apparentTemperature;
  @override
  @JsonKey(name: 'apparent_temperature')
  List<double> get apparentTemperature {
    if (_apparentTemperature is EqualUnmodifiableListView)
      return _apparentTemperature;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_apparentTemperature);
  }

  final List<int> _weatherCode;
  @override
  @JsonKey(name: 'weather_code')
  List<int> get weatherCode {
    if (_weatherCode is EqualUnmodifiableListView) return _weatherCode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weatherCode);
  }

  @override
  String toString() {
    return 'HourlyDataDto(time: $time, apparentTemperature: $apparentTemperature, weatherCode: $weatherCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyDataDtoImpl &&
            const DeepCollectionEquality().equals(other._time, _time) &&
            const DeepCollectionEquality().equals(
              other._apparentTemperature,
              _apparentTemperature,
            ) &&
            const DeepCollectionEquality().equals(
              other._weatherCode,
              _weatherCode,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_time),
    const DeepCollectionEquality().hash(_apparentTemperature),
    const DeepCollectionEquality().hash(_weatherCode),
  );

  /// Create a copy of HourlyDataDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyDataDtoImplCopyWith<_$HourlyDataDtoImpl> get copyWith =>
      __$$HourlyDataDtoImplCopyWithImpl<_$HourlyDataDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyDataDtoImplToJson(this);
  }
}

abstract class _HourlyDataDto implements HourlyDataDto {
  const factory _HourlyDataDto({
    required final List<String> time,
    @JsonKey(name: 'apparent_temperature')
    required final List<double> apparentTemperature,
    @JsonKey(name: 'weather_code') required final List<int> weatherCode,
  }) = _$HourlyDataDtoImpl;

  factory _HourlyDataDto.fromJson(Map<String, dynamic> json) =
      _$HourlyDataDtoImpl.fromJson;

  @override
  List<String> get time;
  @override
  @JsonKey(name: 'apparent_temperature')
  List<double> get apparentTemperature;
  @override
  @JsonKey(name: 'weather_code')
  List<int> get weatherCode;

  /// Create a copy of HourlyDataDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyDataDtoImplCopyWith<_$HourlyDataDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherApiResponseDto _$WeatherApiResponseDtoFromJson(
  Map<String, dynamic> json,
) {
  return _WeatherApiResponseDto.fromJson(json);
}

/// @nodoc
mixin _$WeatherApiResponseDto {
  CurrentWeatherDto get current => throw _privateConstructorUsedError;
  HourlyDataDto get hourly => throw _privateConstructorUsedError;

  /// Serializes this WeatherApiResponseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherApiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherApiResponseDtoCopyWith<WeatherApiResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherApiResponseDtoCopyWith<$Res> {
  factory $WeatherApiResponseDtoCopyWith(
    WeatherApiResponseDto value,
    $Res Function(WeatherApiResponseDto) then,
  ) = _$WeatherApiResponseDtoCopyWithImpl<$Res, WeatherApiResponseDto>;
  @useResult
  $Res call({CurrentWeatherDto current, HourlyDataDto hourly});

  $CurrentWeatherDtoCopyWith<$Res> get current;
  $HourlyDataDtoCopyWith<$Res> get hourly;
}

/// @nodoc
class _$WeatherApiResponseDtoCopyWithImpl<
  $Res,
  $Val extends WeatherApiResponseDto
>
    implements $WeatherApiResponseDtoCopyWith<$Res> {
  _$WeatherApiResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherApiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? current = null, Object? hourly = null}) {
    return _then(
      _value.copyWith(
            current: null == current
                ? _value.current
                : current // ignore: cast_nullable_to_non_nullable
                      as CurrentWeatherDto,
            hourly: null == hourly
                ? _value.hourly
                : hourly // ignore: cast_nullable_to_non_nullable
                      as HourlyDataDto,
          )
          as $Val,
    );
  }

  /// Create a copy of WeatherApiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentWeatherDtoCopyWith<$Res> get current {
    return $CurrentWeatherDtoCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value) as $Val);
    });
  }

  /// Create a copy of WeatherApiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HourlyDataDtoCopyWith<$Res> get hourly {
    return $HourlyDataDtoCopyWith<$Res>(_value.hourly, (value) {
      return _then(_value.copyWith(hourly: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherApiResponseDtoImplCopyWith<$Res>
    implements $WeatherApiResponseDtoCopyWith<$Res> {
  factory _$$WeatherApiResponseDtoImplCopyWith(
    _$WeatherApiResponseDtoImpl value,
    $Res Function(_$WeatherApiResponseDtoImpl) then,
  ) = __$$WeatherApiResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CurrentWeatherDto current, HourlyDataDto hourly});

  @override
  $CurrentWeatherDtoCopyWith<$Res> get current;
  @override
  $HourlyDataDtoCopyWith<$Res> get hourly;
}

/// @nodoc
class __$$WeatherApiResponseDtoImplCopyWithImpl<$Res>
    extends
        _$WeatherApiResponseDtoCopyWithImpl<$Res, _$WeatherApiResponseDtoImpl>
    implements _$$WeatherApiResponseDtoImplCopyWith<$Res> {
  __$$WeatherApiResponseDtoImplCopyWithImpl(
    _$WeatherApiResponseDtoImpl _value,
    $Res Function(_$WeatherApiResponseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherApiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? current = null, Object? hourly = null}) {
    return _then(
      _$WeatherApiResponseDtoImpl(
        current: null == current
            ? _value.current
            : current // ignore: cast_nullable_to_non_nullable
                  as CurrentWeatherDto,
        hourly: null == hourly
            ? _value.hourly
            : hourly // ignore: cast_nullable_to_non_nullable
                  as HourlyDataDto,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherApiResponseDtoImpl implements _WeatherApiResponseDto {
  const _$WeatherApiResponseDtoImpl({
    required this.current,
    required this.hourly,
  });

  factory _$WeatherApiResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherApiResponseDtoImplFromJson(json);

  @override
  final CurrentWeatherDto current;
  @override
  final HourlyDataDto hourly;

  @override
  String toString() {
    return 'WeatherApiResponseDto(current: $current, hourly: $hourly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherApiResponseDtoImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.hourly, hourly) || other.hourly == hourly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, current, hourly);

  /// Create a copy of WeatherApiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherApiResponseDtoImplCopyWith<_$WeatherApiResponseDtoImpl>
  get copyWith =>
      __$$WeatherApiResponseDtoImplCopyWithImpl<_$WeatherApiResponseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherApiResponseDtoImplToJson(this);
  }
}

abstract class _WeatherApiResponseDto implements WeatherApiResponseDto {
  const factory _WeatherApiResponseDto({
    required final CurrentWeatherDto current,
    required final HourlyDataDto hourly,
  }) = _$WeatherApiResponseDtoImpl;

  factory _WeatherApiResponseDto.fromJson(Map<String, dynamic> json) =
      _$WeatherApiResponseDtoImpl.fromJson;

  @override
  CurrentWeatherDto get current;
  @override
  HourlyDataDto get hourly;

  /// Create a copy of WeatherApiResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherApiResponseDtoImplCopyWith<_$WeatherApiResponseDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
