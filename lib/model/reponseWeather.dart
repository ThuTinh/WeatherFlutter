import 'weather.dart';
import 'city.dart';

class ReponseWeather {
  String cod;
  int message;
  int cnt;
  List<Weather> list;
  City city;
  ReponseWeather({this.cod, this.message, this.cnt, this.list, this.city});

  factory ReponseWeather.fromJson(Map<String, dynamic> json) => ReponseWeather(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<Weather>.from(json["list"].map((x) => Weather.fromJson(x))),
        // list: null,
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<Map<String, dynamic>>.from(list.map((x) => x.toJson())),
        "city": city.toJson()
      };

  static List<Weather> makeListFromJson(List<Map<String, dynamic>> jsons) {
    List<Weather> tempList;
    for (var item in jsons) {
      tempList.add(Weather.fromJson(item));
    }
    return tempList;
  }
}
