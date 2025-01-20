import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required double temperature,
    required int humidity,
    required double windSpeed,
    required String description,
    required String icon,
    required String cityName,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
}
