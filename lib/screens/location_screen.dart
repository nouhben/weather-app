import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weather_remake/models/weather.dart';
import 'package:weather_remake/screens/city_screen.dart';
import 'package:weather_remake/services/weather_service.dart';
import 'package:weather_remake/shared/constants.dart';

class LocationScreen extends StatefulWidget {
  final Weather weather;
  LocationScreen({
    Key key,
    this.weather,
  }) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String message, city, icon;
  WeatherService _weatherService;
  @override
  void initState() {
    super.initState();
    _weatherService = WeatherService();
    updateUI(weather: widget.weather);
  }

  void updateUI({Weather weather}) {
    setState(() {
      temperature = weather.temperature.toInt();
      message = weather.getMessage();
      icon = weather.getWeatherIcon();
      city = weather.city;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1514632595-4944383f2737?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2468&q=80',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      updateUI(
                        weather: await _weatherService.getWeatherData(),
                      );
                    },
                    child: const Icon(
                      CupertinoIcons.location_north,
                      color: Colors.black,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final String _cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      if (_cityName.isNotEmpty) {
                        updateUI(
                          weather: await _weatherService.getCityWeatherData(
                            cityName: _cityName,
                          ),
                        );
                      }
                    },
                    child: const Icon(
                      CupertinoIcons.house,
                      color: Colors.black,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        '$temperature°',
                        style: kTempTextStyle,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        icon,
                        style: kConditionTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    '$message in $city',
                    textAlign: TextAlign.left,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
