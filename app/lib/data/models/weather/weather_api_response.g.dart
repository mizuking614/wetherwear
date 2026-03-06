// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentWeatherDtoImpl _$$CurrentWeatherDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CurrentWeatherDtoImpl(
  temperature2m: (json['temperature_2m'] as num).toDouble(),
  apparentTemperature: (json['apparent_temperature'] as num).toDouble(),
  relativeHumidity2m: (json['relative_humidity_2m'] as num).toInt(),
  windSpeed10m: (json['wind_speed_10m'] as num).toDouble(),
  weatherCode: (json['weather_code'] as num).toInt(),
);

Map<String, dynamic> _$$CurrentWeatherDtoImplToJson(
  _$CurrentWeatherDtoImpl instance,
) => <String, dynamic>{
  'temperature_2m': instance.temperature2m,
  'apparent_temperature': instance.apparentTemperature,
  'relative_humidity_2m': instance.relativeHumidity2m,
  'wind_speed_10m': instance.windSpeed10m,
  'weather_code': instance.weatherCode,
};

_$HourlyDataDtoImpl _$$HourlyDataDtoImplFromJson(Map<String, dynamic> json) =>
    _$HourlyDataDtoImpl(
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      apparentTemperature: (json['apparent_temperature'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      weatherCode: (json['weather_code'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$HourlyDataDtoImplToJson(_$HourlyDataDtoImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'apparent_temperature': instance.apparentTemperature,
      'weather_code': instance.weatherCode,
    };

_$WeatherApiResponseDtoImpl _$$WeatherApiResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$WeatherApiResponseDtoImpl(
  current: CurrentWeatherDto.fromJson(json['current'] as Map<String, dynamic>),
  hourly: HourlyDataDto.fromJson(json['hourly'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$WeatherApiResponseDtoImplToJson(
  _$WeatherApiResponseDtoImpl instance,
) => <String, dynamic>{'current': instance.current, 'hourly': instance.hourly};
