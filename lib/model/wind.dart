class Wind {
  double speed;
  double deg;

  Wind({this.speed, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) =>
      Wind(speed: json["speed"].toDouble(), deg: json["deg"].toDouble());

  Map<String, dynamic> toJson() => {"speed": speed, "deg": deg};
}
