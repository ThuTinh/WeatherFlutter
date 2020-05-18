class SubWeather {
  int id;
  String main;
  String description;
  String icon;

  SubWeather({this.id, this.main, this.description, this.icon});

  factory SubWeather.fromJson(Map<String, dynamic> json) => SubWeather(
        id: json["id"].toInt(),
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );
  Map<String, dynamic> toJson() =>
      {"id": id, "main": main, "description": description, "icon": icon};
}
