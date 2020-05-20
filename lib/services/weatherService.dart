import 'package:app_demo/model/weather.dart';
import 'package:http/http.dart' as http;
import '../model/reponseWeather.dart';
import 'dart:convert';

class WeatherService {
  Future<ReponseWeather> getWeatherByNameCity(String city) async {
    String url =
        'http://api.openweathermap.org/data/2.5/forecast?q=Ho Chi Minh&appid=767d5108884b77de30f4d53b0300675f';
    final response = await http.get(url);
     Map<String, dynamic> a = json.decode(response.body);
      return ReponseWeather.fromJson(json.decode(response.body));
  }
}
