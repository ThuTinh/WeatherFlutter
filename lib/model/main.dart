class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  int humidity;
  double tempKf;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.seaLevel,
      this.grndLevel,
      this.humidity,
      this.tempKf});
  factory Main.fromJson(Map<String, dynamic> json) => Main(
      temp: json["temp"].toDouble(),
      feelsLike: json["feels_like"].toDouble(),
      tempMin: json["temp_min"].toDouble(),
      tempMax: json["temp_max"].toDouble(),
      pressure: json["pressure"].toInt(),
      seaLevel: json["sea_level"].toInt(),
      grndLevel: json["grnd_level"].toInt(),
      humidity: json["humidity"].toInt(),
      tempKf: json["temp_kf"].toDouble());

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf
      };
}
