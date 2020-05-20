import 'package:app_demo/contanst/contansts.dart';
import 'package:app_demo/model/reponseWeather.dart';
import 'package:app_demo/screens/locationWeather.dart';
import 'package:app_demo/screens/wiget/listItemDaily.dart';
import 'package:app_demo/screens/wiget/listItemHourly.dart';
import 'package:flutter/material.dart';
import '../services/weatherService.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:app_demo/model/weather.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String curentCity;
  ReponseWeather reponseWeather = new ReponseWeather();
  Weather weather = new Weather();
  List<Weather> lsCurentWeather = new List();
  List<Weather> lsWeatherFor5Day = new List();

  Future<void> getData() async {
    WeatherService service = WeatherService();
    List<Weather> curentWeathers = new List();
    List<Weather> weatherFor5Days = new List();
    Weather tempWeather = new Weather();
    ReponseWeather tempReponseWeather;
    tempReponseWeather = await service.getWeatherByNameCity(curentCity);
    for (var i = 0; i < tempReponseWeather.list.length; i++) {
      if (tempReponseWeather.list[i].dtTxt.day == DateTime.now().day) {
        curentWeathers.add(tempReponseWeather.list[i]);
        if (i < tempReponseWeather.list.length - 1) {
          if (tempReponseWeather.list[i].dtTxt.hour <= DateTime.now().hour &&
              tempReponseWeather.list[i + 1].dtTxt.hour > DateTime.now().hour) {
            tempWeather = tempReponseWeather.list[i];
          }
        } else {
          if (weather == null) {
            tempWeather =
                tempReponseWeather.list[tempReponseWeather.list.length - 1];
          }
        }
      } else {
        weatherFor5Days.add(tempReponseWeather.list[i]);
      }
    }
    setState(() {
      this.reponseWeather = tempReponseWeather;
      this.lsCurentWeather = curentWeathers;
      this.lsWeatherFor5Day = weatherFor5Days;
      this.weather = tempWeather;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      curentCity = "Ha Noi";
    });
    getData();
  }

  void onSelectAction(String choice) async {
    Route route = MaterialPageRoute(builder: (context) => LocationWeather());
    final result = await  Navigator.push(context, route);
     print("curent city1" + result);
    setState(() {
      curentCity = result;
      print("curent city" + curentCity);
    });
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather forecasts",
          textAlign: TextAlign.center,
          style: TextStyle(),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
              onSelected: onSelectAction,
              itemBuilder: (BuildContext context) {
                return Contansts.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              })
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
                child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Text('${this.reponseWeather?.city?.name}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0)),
                        ),

                        RichText(
                            text: TextSpan(
                                text:
                                    '  ${weather?.dtTxt?.year} /${weather?.dtTxt?.month}/ ${weather?.dtTxt?.day}',
                                style: TextStyle(fontSize: 13.0),
                                children: [
                              TextSpan(
                                text:
                                    ' ${DateTime.now().hour}: ${DateTime.now().minute}',
                              ),
                            ])),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // BoxedIcon(
                            //   WeatherIcons.day_cloudy,
                            //   size: 60.0,
                            //   color: Hexcolor("#FFD600"),
                            // ),
                            Image.network(
                                'http://openweathermap.org/img/wn/${weather != null ? weather.weather[0].icon : "04n"}@2x.png'),
                            RichText(
                                text: TextSpan(
                                    text:
                                        '${weather != null ? (weather.main.temp - 273).toStringAsFixed(1) : 0}',
                                    style: TextStyle(fontSize: 50.0),
                                    children: [
                                  TextSpan(
                                      text: "°",
                                      style: TextStyle(fontSize: 50.0)),
                                ])),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        RichText(
                            text: TextSpan(
                                text:
                                    '${weather != null ? (weather.main.tempMax - 273).toStringAsFixed(1) : 0}',
                                style: TextStyle(fontSize: 14.0),
                                children: [
                              TextSpan(
                                text: "°",
                              ),
                              TextSpan(text: "/"),
                              TextSpan(
                                  text:
                                      '${weather != null ? (weather.main.tempMin - 273).toStringAsFixed(1) : 0}'),
                              TextSpan(
                                text: "°",
                              ),
                              TextSpan(text: " feel like "),
                              TextSpan(
                                  text:
                                      '${weather != null ? (weather.main.feelsLike - 273).toStringAsFixed(1) : 0}'),
                              TextSpan(
                                text: "°",
                              ),
                            ])),
                        // SizedBox(
                        //   height: 8.0,
                        // ),
                        Text(
                            '${weather != null ? weather.weather[0].description : ""}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Hexcolor("#80D8FF")),
                    child: Row(
                      // mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 18.0,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "Humidity",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text('${weather.main.humidity} %',
                                          style: TextStyle(fontSize: 18))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  color: Colors.white60,
                                  height: 30.0,
                                  width: 1.0,
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                ),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.barometer,
                                    size: 18.0,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text("pressure",
                                          style: TextStyle(fontSize: 18)),
                                      Text('${weather.main.pressure} hpa',
                                          style: TextStyle(fontSize: 18))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text("Hourly"),
                      )
                    ],
                  ),
                  // Hang gio
                  Container(
                    height: 250.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: this.lsCurentWeather == null
                          ? 0
                          : this.lsCurentWeather.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListItemHourly(
                            weather: this.lsCurentWeather[index]);
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text("Daily"),
                      )
                    ],
                  ),

                  Container(
                    height: 250.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: this.lsWeatherFor5Day == null
                          ? 0
                          : (this.lsWeatherFor5Day.length / 8.0).ceil(),
                      itemBuilder: (BuildContext context, int index) {
                        return ListItemDaily(
                            weather: this.lsWeatherFor5Day[index * 8]);
                      },
                    ),
                  ),

                  //Chi Tiet
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text("Detail"),
                      ),
                    ],
                  ),
                  Container(
                    height: 300.0,
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          title: Text("lat"),
                          // leading: BoxedIcon(WeatherIcons.raindrop),
                          trailing: Text('${reponseWeather.city.coord.lat}'),
                        ),
                        ListTile(
                          title: Text("lon"),
                          // leading: BoxedIcon(WeatherIcons.raindrop),
                          trailing: Text('${reponseWeather.city.coord.lon}'),
                        ),
                        ListTile(
                          title: Text("population"),
                          // leading: BoxedIcon(WeatherIcons.raindrop),
                          trailing: Text('${reponseWeather.city.population}'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
        );
      }),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "ThuTinh",
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                "thutinh@gmail.com",
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("Avata", style: TextStyle(fontSize: 20.0))),
            ),
            ListTile(
                leading: Icon(Icons.home, color: Colors.black),
                title: Text(
                  " Home",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                leading: Icon(Icons.settings, color: Colors.black),
                title: Text("Setting", style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                leading: Icon(Icons.contacts, color: Colors.black),
                title:
                    Text("Contact Us", style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
