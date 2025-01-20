# Weather App

Modern weather application built with Flutter that provides real-time weather information.

## Features

- Real-time weather data using OpenWeatherMap API
- Location-based weather information
- Search weather by city name
- Beautiful UI with dynamic weather icons
- Display temperature, humidity, and wind speed
- Support for dark/light mode
- Pull-to-refresh functionality

## Requirements

- Flutter SDK
- Android Studio / VS Code
- OpenWeatherMap API key
- Android SDK (for Android build)

## Setup

1. Clone the repository
2. Get Flutter dependencies:
   ```bash
   flutter pub get
   ```
3. Add your OpenWeatherMap API key:
   - Sign up at [OpenWeatherMap](https://openweathermap.org/)
   - Get your API key
   - Replace `YOUR_API_KEY` in `lib/services/weather_service.dart`

## Build

### Debug Mode
```bash
flutter run
```

### Release Mode
```bash
flutter build apk --release
```

## Project Structure

```
lib/
  ├── models/         # Data models
  ├── services/       # API services
  ├── providers/      # State management
  ├── screens/        # UI screens
  ├── widgets/        # Reusable widgets
  └── utils/          # Helper functions
```

## Dependencies

- flutter_riverpod: State management
- http: API calls
- geolocator: Location services
- cached_network_image: Image caching
- freezed: Code generation
- json_serializable: JSON serialization
