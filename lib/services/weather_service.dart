import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_remake/models/weather.dart';

import 'location_service.dart';

class WeatherService {
  final String _apiKey = '242ace4bcb3bfada1127902e5364f258';
  final String _url = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> getWeatherData() async {
    try {
      final _locationService = LocationService();
      await _locationService.determinePosition();
      print(
          'lat=${_locationService.latitude}&lon=${_locationService.longitude}');
      final String _apiUrl =
          '$_url?lat=${_locationService.latitude}&lon=${_locationService.longitude}&appid=$_apiKey&units=metric';
      final http.Response response = await http.get(Uri.parse(_apiUrl));
      if (response.statusCode == 200) {
        final Weather weather = Weather.fromJson(response.body);
        print('${weather.toString()}');
        return weather;
      } else {
        print('error http code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error');
    }
    return null;
  }

  Future<Weather> getCityWeatherData({@required String cityName}) async {
    try {
      final String _apiUrl = '$_url?q=$cityName&appid=$_apiKey&units=metric';
      final http.Response response = await http.get(Uri.parse(_apiUrl));
      if (response.statusCode == 200) {
        final Weather weather = Weather.fromJson(response.body);
        print('${weather.toString()}');
        return weather;
      } else {
        print('error http code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error');
    }
    return null;
  }
}
