import 'package:flutter/material.dart';

class WeatherInfoCard extends StatelessWidget {
  final double temperature;
  final int humidity;
  final double windSpeed;

  const WeatherInfoCard({
    super.key,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow(
              Icons.thermostat,
              '${temperature.toStringAsFixed(1)}°C',
              'Temperature',
            ),
            const Divider(color: Colors.white30),
            _buildInfoRow(
              Icons.water_drop,
              '$humidity%',
              'Humidity',
            ),
            const Divider(color: Colors.white30),
            _buildInfoRow(
              Icons.air,
              '${windSpeed.toStringAsFixed(1)} m/s',
              'Wind Speed',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String value, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
