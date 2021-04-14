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

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: double.infinity,
        height: 200.0,
        child: Column(
          children: [
            Text('Home Screen'),
            ElevatedButton(
              onPressed: () {},
              child: Text('Press me!'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(backgroundColor: Colors.black),
      ),
    );
  }
}
