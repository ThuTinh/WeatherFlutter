import 'package:app_demo/model/reponseWeather.dart';
import 'package:flutter/material.dart';
import '../services/weatherService.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherService service = WeatherService();
  ReponseWeather reponseWeather;
  @override
  void initState() {
    super.initState();
    service.getWeatherByNameCity("demo").then((reponse){
      print("init data" + reponse.toString());
      reponseWeather = reponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Data ne"+ reponseWeather.city.toString());
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Weather forecasts",
        textAlign: TextAlign.center,
        style: TextStyle(),
      )),
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
                          child: Text('Ho Chi Minh',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 25.0)),
                        ),

                        RichText(
                            text: TextSpan(
                                text: '8 Jun 28 ',
                                style: TextStyle(fontSize: 13.0),
                                children: [
                              TextSpan(
                                text: " 10:00 AM",
                              ),
                            ])),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            BoxedIcon(
                              WeatherIcons.day_cloudy,
                              size: 60.0,
                              color: Hexcolor("#FFD600"),
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "33",
                                    style: TextStyle(fontSize: 50.0),
                                    children: [
                                  TextSpan(
                                      text: "°",
                                      style: TextStyle(fontSize: 30.0)),
                                ])),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "35",
                                style: TextStyle(fontSize: 14.0),
                                children: [
                              TextSpan(
                                text: "°",
                              ),
                              TextSpan(text: "/"),
                              TextSpan(text: "27"),
                              TextSpan(
                                text: "°",
                              ),
                              TextSpan(text: " feel like "),
                              TextSpan(text: "27"),
                              TextSpan(
                                text: "°",
                              ),
                            ])),
                        // SizedBox(
                        //   height: 8.0,
                        // ),
                        Text("broken clouds",
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
                                      Text("90%",
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
                                    WeatherIcons.humidity,
                                    size: 18.0,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text("pressure",
                                          style: TextStyle(fontSize: 18)),
                                      Text("90%",
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
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                color: Hexcolor("#757575"),
                                size: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 13.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "13",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                          children: [TextSpan(text: "%")]))
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "30",
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                color: Hexcolor("#757575"),
                                size: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 13.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "13",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                          children: [TextSpan(text: "%")]))
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "30",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                color: Hexcolor("#757575"),
                                size: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 13.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "13",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                          children: [TextSpan(text: "%")]))
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "30",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                color: Hexcolor("#757575"),
                                size: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 13.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "13",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                          children: [TextSpan(text: "%")]))
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "30",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                color: Hexcolor("#757575"),
                                size: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 13.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "13",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                          children: [TextSpan(text: "%")]))
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "30",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                color: Hexcolor("#757575"),
                                size: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 13.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "13",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                          children: [TextSpan(text: "%")]))
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "30",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                color: Hexcolor("#757575"),
                                size: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 13.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "13",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                          children: [TextSpan(text: "%")]))
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "30",
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                color: Hexcolor("#757575"),
                                size: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 13.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "13",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                          children: [TextSpan(text: "%")]))
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "30",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
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
                        child: Text("Hang ngay"),
                      )
                    ],
                  ),
                  //hang ngay
                  Container(
                    height: 150.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                color: Hexcolor("#757575"),
                                size: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 13.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "13",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                          children: [TextSpan(text: "%")]))
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "30",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                color: Hexcolor("#757575"),
                                size: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 13.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "13",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                          children: [TextSpan(text: "%")]))
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "30",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                color: Hexcolor("#757575"),
                                size: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 13.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "13",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                          children: [TextSpan(text: "%")]))
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "30",
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                color: Hexcolor("#757575"),
                                size: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 13.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "13",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                          children: [TextSpan(text: "%")]))
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "30",
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                color: Hexcolor("#757575"),
                                size: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  BoxedIcon(
                                    WeatherIcons.humidity,
                                    size: 13.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "13",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          ),
                                          children: [TextSpan(text: "%")]))
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "30",
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Chi Tiet
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text("Chi tiet"),
                      ),
                    ],
                  ),
                  Container(
                    height: 300.0,
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          title: Text("Chi so UV"),
                          leading: BoxedIcon(WeatherIcons.raindrop),
                          trailing: Text("Rat cao"),
                        ),
                        ListTile(
                          title: Text("Chi so UV"),
                          leading: BoxedIcon(WeatherIcons.raindrop),
                          trailing: Text("Rat cao"),
                        ),
                        ListTile(
                          title: Text("Chi so UV"),
                          leading: BoxedIcon(WeatherIcons.raindrop),
                          trailing: Text("Rat cao"),
                        ),
                        ListTile(
                          title: Text("Chi so UV"),
                          leading: BoxedIcon(WeatherIcons.raindrop),
                          trailing: Text("Rat cao"),
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
                leading:
                    BoxedIcon(WeatherIcons.night_alt_hail, color: Colors.black),
                title: Text(
                  "Home",
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
