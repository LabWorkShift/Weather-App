import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

final weatherServiceProvider = Provider((ref) => WeatherService());

final weatherProvider = StateNotifierProvider<WeatherNotifier, AsyncValue<WeatherModel>>((ref) {
  final weatherService = ref.watch(weatherServiceProvider);
  return WeatherNotifier(weatherService);
});

class WeatherNotifier extends StateNotifier<AsyncValue<WeatherModel>> {
  final WeatherService _weatherService;

  WeatherNotifier(this._weatherService) : super(const AsyncValue.loading()) {
    getCurrentLocationWeather();
  }

  Future<void> getCurrentLocationWeather() async {
    try {
      state = const AsyncValue.loading();
      final weather = await _weatherService.getWeatherByLocation();
      state = AsyncValue.data(weather);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> getWeatherByCity(String city) async {
    try {
      state = const AsyncValue.loading();
      final weather = await _weatherService.getWeatherByCity(city);
      state = AsyncValue.data(weather);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
