// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HourlyForecastImpl _$$HourlyForecastImplFromJson(Map<String, dynamic> json) =>
    _$HourlyForecastImpl(
      time: DateTime.parse(json['time'] as String),
      apparentTemp: (json['apparentTemp'] as num).toDouble(),
      weatherCode: (json['weatherCode'] as num).toInt(),
    );

Map<String, dynamic> _$$HourlyForecastImplToJson(
  _$HourlyForecastImpl instance,
) => <String, dynamic>{
  'time': instance.time.toIso8601String(),
  'apparentTemp': instance.apparentTemp,
  'weatherCode': instance.weatherCode,
};

_$WeatherDataImpl _$$WeatherDataImplFromJson(Map<String, dynamic> json) =>
    _$WeatherDataImpl(
      currentTemp: (json['currentTemp'] as num).toDouble(),
      apparentTemp: (json['apparentTemp'] as num).toDouble(),
      humidity: (json['humidity'] as num).toInt(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      weatherCode: (json['weatherCode'] as num).toInt(),
      hourlyForecast: (json['hourlyForecast'] as List<dynamic>)
          .map((e) => HourlyForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeatherDataImplToJson(_$WeatherDataImpl instance) =>
    <String, dynamic>{
      'currentTemp': instance.currentTemp,
      'apparentTemp': instance.apparentTemp,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'weatherCode': instance.weatherCode,
      'hourlyForecast': instance.hourlyForecast,
    };
