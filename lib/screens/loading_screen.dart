import 'package:flutter/material.dart';
import 'package:weather_remake/screens/location_screen.dart';
import 'package:weather_remake/services/weather_service.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  initState() {
    super.initState();
    getCurrentLocationWeather();
  }

  void getCurrentLocationWeather() async {
    final _weather = await WeatherService().getWeatherData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(weather: _weather),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
