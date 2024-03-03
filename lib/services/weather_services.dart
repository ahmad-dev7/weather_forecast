import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_forecast/model/models.dart';

class WeatherServices {
  Future<WeatherDetails> fetchWeather(
      {required String lat, required String lon}) async {
    String baseUrl = 'https://api.openweathermap.org/data/2.5/weather?';
    String apiKey = '2a5237306d2ff67f42dd19bdba2d3b3e';
    var response = await http.get(
      Uri.parse('${baseUrl}lat=$lat&lon=$lon&appid=$apiKey'),
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      WeatherDetails weatherData = WeatherDetails(
        cityName: data['name'],
        temperature: data['main']['temp'],
        weatherDescription: data['weather'][0]['description'],
        dateTimeSinceEpoch: data['dt'],
        sunriseTimeSinceEpoch: data['sys']['sunrise'],
        sunsetTimeSinceEpoch: data['sys']['sunset'],
        windSpeed: data['wind']['speed'],
        humidity: data['main']['humidity'],
        pressure: data['main']['pressure'],
        cloud: data['clouds']['all'],
        iconCode: data['weather'][0]['icon'],
        countryCode: data['sys']['country'],
      );
      return weatherData;
    } else {
      throw ('Error! Please Check Your Internet Connection');
    }
  }
}
