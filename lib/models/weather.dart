import 'dart:convert';

class Weather {
  final double temperature;
  final int condition;
  final String city;

  const Weather({
    this.temperature,
    this.condition,
    this.city,
  });

  @override
  String toString() =>
      'temperature: $temperature, condition: $condition in ${city.toUpperCase()}';

  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'condition': condition,
      'city': city,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      temperature: map['main']['temp'],
      condition: map['weather'][0]['id'],
      city: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source));

  String getWeatherIcon() {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    int temp = this.temperature.round();
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
