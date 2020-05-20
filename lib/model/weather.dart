import 'clouds.dart';
import 'subWeather.dart';
import 'wind.dart';
import 'main.dart';
import 'sys.dart';

class Weather {
  int dt;
  Main main;
  List<SubWeather>  weather;
  Clouds clouds;
  Wind wind;
  Sys sys;
  DateTime dtTxt;

  Weather(
      {this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.sys,
      this.dtTxt});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        dt: json["dt"],
        main: Main.fromJson(json["main"]),
        weather:List<SubWeather>.from(json["weather"].map((x) => SubWeather.fromJson(x))),
        clouds: Clouds.fromJson(json["clouds"]),
        wind: Wind.fromJson(json["wind"]),
        sys: Sys.fromJson(json["sys"]),
        dtTxt:  DateTime.parse(json["dt_txt"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main.toJson(),
        "weather": List<Map<String, dynamic>>.from(weather.map((x) => x.toJson())),
        "clouds": clouds.toJson(),
        "wind": wind.toJson(),
        "sys" : sys.toString(),
        "dt_txt": dtTxt.toString()
      };
}
