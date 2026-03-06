// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HourlyForecast _$HourlyForecastFromJson(Map<String, dynamic> json) {
  return _HourlyForecast.fromJson(json);
}

/// @nodoc
mixin _$HourlyForecast {
  DateTime get time => throw _privateConstructorUsedError;
  double get apparentTemp => throw _privateConstructorUsedError;
  int get weatherCode => throw _privateConstructorUsedError;

  /// Serializes this HourlyForecast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyForecastCopyWith<HourlyForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyForecastCopyWith<$Res> {
  factory $HourlyForecastCopyWith(
    HourlyForecast value,
    $Res Function(HourlyForecast) then,
  ) = _$HourlyForecastCopyWithImpl<$Res, HourlyForecast>;
  @useResult
  $Res call({DateTime time, double apparentTemp, int weatherCode});
}

/// @nodoc
class _$HourlyForecastCopyWithImpl<$Res, $Val extends HourlyForecast>
    implements $HourlyForecastCopyWith<$Res> {
  _$HourlyForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? apparentTemp = null,
    Object? weatherCode = null,
  }) {
    return _then(
      _value.copyWith(
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            apparentTemp: null == apparentTemp
                ? _value.apparentTemp
                : apparentTemp // ignore: cast_nullable_to_non_nullable
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
abstract class _$$HourlyForecastImplCopyWith<$Res>
    implements $HourlyForecastCopyWith<$Res> {
  factory _$$HourlyForecastImplCopyWith(
    _$HourlyForecastImpl value,
    $Res Function(_$HourlyForecastImpl) then,
  ) = __$$HourlyForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime time, double apparentTemp, int weatherCode});
}

/// @nodoc
class __$$HourlyForecastImplCopyWithImpl<$Res>
    extends _$HourlyForecastCopyWithImpl<$Res, _$HourlyForecastImpl>
    implements _$$HourlyForecastImplCopyWith<$Res> {
  __$$HourlyForecastImplCopyWithImpl(
    _$HourlyForecastImpl _value,
    $Res Function(_$HourlyForecastImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? apparentTemp = null,
    Object? weatherCode = null,
  }) {
    return _then(
      _$HourlyForecastImpl(
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        apparentTemp: null == apparentTemp
            ? _value.apparentTemp
            : apparentTemp // ignore: cast_nullable_to_non_nullable
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
class _$HourlyForecastImpl implements _HourlyForecast {
  const _$HourlyForecastImpl({
    required this.time,
    required this.apparentTemp,
    required this.weatherCode,
  });

  factory _$HourlyForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyForecastImplFromJson(json);

  @override
  final DateTime time;
  @override
  final double apparentTemp;
  @override
  final int weatherCode;

  @override
  String toString() {
    return 'HourlyForecast(time: $time, apparentTemp: $apparentTemp, weatherCode: $weatherCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyForecastImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.apparentTemp, apparentTemp) ||
                other.apparentTemp == apparentTemp) &&
            (identical(other.weatherCode, weatherCode) ||
                other.weatherCode == weatherCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, apparentTemp, weatherCode);

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyForecastImplCopyWith<_$HourlyForecastImpl> get copyWith =>
      __$$HourlyForecastImplCopyWithImpl<_$HourlyForecastImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyForecastImplToJson(this);
  }
}

abstract class _HourlyForecast implements HourlyForecast {
  const factory _HourlyForecast({
    required final DateTime time,
    required final double apparentTemp,
    required final int weatherCode,
  }) = _$HourlyForecastImpl;

  factory _HourlyForecast.fromJson(Map<String, dynamic> json) =
      _$HourlyForecastImpl.fromJson;

  @override
  DateTime get time;
  @override
  double get apparentTemp;
  @override
  int get weatherCode;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyForecastImplCopyWith<_$HourlyForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) {
  return _WeatherData.fromJson(json);
}

/// @nodoc
mixin _$WeatherData {
  double get currentTemp => throw _privateConstructorUsedError;
  double get apparentTemp => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  double get windSpeed => throw _privateConstructorUsedError;
  int get weatherCode => throw _privateConstructorUsedError;
  List<HourlyForecast> get hourlyForecast => throw _privateConstructorUsedError;

  /// Serializes this WeatherData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherDataCopyWith<WeatherData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataCopyWith<$Res> {
  factory $WeatherDataCopyWith(
    WeatherData value,
    $Res Function(WeatherData) then,
  ) = _$WeatherDataCopyWithImpl<$Res, WeatherData>;
  @useResult
  $Res call({
    double currentTemp,
    double apparentTemp,
    int humidity,
    double windSpeed,
    int weatherCode,
    List<HourlyForecast> hourlyForecast,
  });
}

/// @nodoc
class _$WeatherDataCopyWithImpl<$Res, $Val extends WeatherData>
    implements $WeatherDataCopyWith<$Res> {
  _$WeatherDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTemp = null,
    Object? apparentTemp = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? weatherCode = null,
    Object? hourlyForecast = null,
  }) {
    return _then(
      _value.copyWith(
            currentTemp: null == currentTemp
                ? _value.currentTemp
                : currentTemp // ignore: cast_nullable_to_non_nullable
                      as double,
            apparentTemp: null == apparentTemp
                ? _value.apparentTemp
                : apparentTemp // ignore: cast_nullable_to_non_nullable
                      as double,
            humidity: null == humidity
                ? _value.humidity
                : humidity // ignore: cast_nullable_to_non_nullable
                      as int,
            windSpeed: null == windSpeed
                ? _value.windSpeed
                : windSpeed // ignore: cast_nullable_to_non_nullable
                      as double,
            weatherCode: null == weatherCode
                ? _value.weatherCode
                : weatherCode // ignore: cast_nullable_to_non_nullable
                      as int,
            hourlyForecast: null == hourlyForecast
                ? _value.hourlyForecast
                : hourlyForecast // ignore: cast_nullable_to_non_nullable
                      as List<HourlyForecast>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeatherDataImplCopyWith<$Res>
    implements $WeatherDataCopyWith<$Res> {
  factory _$$WeatherDataImplCopyWith(
    _$WeatherDataImpl value,
    $Res Function(_$WeatherDataImpl) then,
  ) = __$$WeatherDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double currentTemp,
    double apparentTemp,
    int humidity,
    double windSpeed,
    int weatherCode,
    List<HourlyForecast> hourlyForecast,
  });
}

/// @nodoc
class __$$WeatherDataImplCopyWithImpl<$Res>
    extends _$WeatherDataCopyWithImpl<$Res, _$WeatherDataImpl>
    implements _$$WeatherDataImplCopyWith<$Res> {
  __$$WeatherDataImplCopyWithImpl(
    _$WeatherDataImpl _value,
    $Res Function(_$WeatherDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTemp = null,
    Object? apparentTemp = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? weatherCode = null,
    Object? hourlyForecast = null,
  }) {
    return _then(
      _$WeatherDataImpl(
        currentTemp: null == currentTemp
            ? _value.currentTemp
            : currentTemp // ignore: cast_nullable_to_non_nullable
                  as double,
        apparentTemp: null == apparentTemp
            ? _value.apparentTemp
            : apparentTemp // ignore: cast_nullable_to_non_nullable
                  as double,
        humidity: null == humidity
            ? _value.humidity
            : humidity // ignore: cast_nullable_to_non_nullable
                  as int,
        windSpeed: null == windSpeed
            ? _value.windSpeed
            : windSpeed // ignore: cast_nullable_to_non_nullable
                  as double,
        weatherCode: null == weatherCode
            ? _value.weatherCode
            : weatherCode // ignore: cast_nullable_to_non_nullable
                  as int,
        hourlyForecast: null == hourlyForecast
            ? _value._hourlyForecast
            : hourlyForecast // ignore: cast_nullable_to_non_nullable
                  as List<HourlyForecast>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDataImpl implements _WeatherData {
  const _$WeatherDataImpl({
    required this.currentTemp,
    required this.apparentTemp,
    required this.humidity,
    required this.windSpeed,
    required this.weatherCode,
    required final List<HourlyForecast> hourlyForecast,
  }) : _hourlyForecast = hourlyForecast;

  factory _$WeatherDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDataImplFromJson(json);

  @override
  final double currentTemp;
  @override
  final double apparentTemp;
  @override
  final int humidity;
  @override
  final double windSpeed;
  @override
  final int weatherCode;
  final List<HourlyForecast> _hourlyForecast;
  @override
  List<HourlyForecast> get hourlyForecast {
    if (_hourlyForecast is EqualUnmodifiableListView) return _hourlyForecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyForecast);
  }

  @override
  String toString() {
    return 'WeatherData(currentTemp: $currentTemp, apparentTemp: $apparentTemp, humidity: $humidity, windSpeed: $windSpeed, weatherCode: $weatherCode, hourlyForecast: $hourlyForecast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDataImpl &&
            (identical(other.currentTemp, currentTemp) ||
                other.currentTemp == currentTemp) &&
            (identical(other.apparentTemp, apparentTemp) ||
                other.apparentTemp == apparentTemp) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.weatherCode, weatherCode) ||
                other.weatherCode == weatherCode) &&
            const DeepCollectionEquality().equals(
              other._hourlyForecast,
              _hourlyForecast,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentTemp,
    apparentTemp,
    humidity,
    windSpeed,
    weatherCode,
    const DeepCollectionEquality().hash(_hourlyForecast),
  );

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDataImplCopyWith<_$WeatherDataImpl> get copyWith =>
      __$$WeatherDataImplCopyWithImpl<_$WeatherDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDataImplToJson(this);
  }
}

abstract class _WeatherData implements WeatherData {
  const factory _WeatherData({
    required final double currentTemp,
    required final double apparentTemp,
    required final int humidity,
    required final double windSpeed,
    required final int weatherCode,
    required final List<HourlyForecast> hourlyForecast,
  }) = _$WeatherDataImpl;

  factory _WeatherData.fromJson(Map<String, dynamic> json) =
      _$WeatherDataImpl.fromJson;

  @override
  double get currentTemp;
  @override
  double get apparentTemp;
  @override
  int get humidity;
  @override
  double get windSpeed;
  @override
  int get weatherCode;
  @override
  List<HourlyForecast> get hourlyForecast;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherDataImplCopyWith<_$WeatherDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
