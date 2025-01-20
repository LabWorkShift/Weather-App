import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import '../models/weather_model.dart';

class WeatherService {
  static const String _apiKey = 'YOUR_API_KEY';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<WeatherModel> getWeatherByLocation() async {
    final position = await getCurrentLocation();
    final response = await http.get(
      Uri.parse('$_baseUrl/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$_apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return WeatherModel(
        temperature: (data['main']['temp'] as num).toDouble(),
        humidity: data['main']['humidity'] as int,
        windSpeed: (data['wind']['speed'] as num).toDouble(),
        description: data['weather'][0]['description'] as String,
        icon: data['weather'][0]['icon'] as String,
        cityName: data['name'] as String,
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<WeatherModel> getWeatherByCity(String city) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/weather?q=$city&appid=$_apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WeatherModel(
        temperature: (data['main']['temp'] as num).toDouble(),
        humidity: data['main']['humidity'] as int,
        windSpeed: (data['wind']['speed'] as num).toDouble(),
        description: data['weather'][0]['description'] as String,
        icon: data['weather'][0]['icon'] as String,
        cityName: data['name'] as String,
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
