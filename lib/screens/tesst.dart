import 'package:app_demo/model/reponseWeather.dart';
import 'package:flutter/material.dart';
import '../services/weatherService.dart';
import 'package:weather_icons/weather_icons.dart';

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

    // service.getWeatherByNameCity("demo").then((reponse) {
    //   print("datatatat"+ reponse.list.toString());
    //   // for (var item in reponse.list) {
    //   //   Weather weather = Weather.fromJson(item);
    //   //   listWeather.add(weather);
    //   // }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Weather forecasts",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      )),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: new ConstrainedBox(
            constraints: new BoxConstraints( minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
             child:  Center(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: <Widget>[
                        Text('Ho Chi Minh',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 25.0)),
                        RichText(
                            text: TextSpan(
                                text: '8 Jun 28 ',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 13.0),
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
                              color: Colors.red,
                              size: 60.0,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "33",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 50.0),
                                    children: [
                                  TextSpan(
                                      text: "°",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 30.0)),
                                ])),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "35",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 14.0),
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
                                TextStyle(color: Colors.blue, fontSize: 15.0)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      border: Border.all(
                        color: Colors.blue[200],
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
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
                                      Text("Humidity"),
                                      Text("90%")
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
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.red,
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
                                      Text("pressure"),
                                      Text("90%")
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
                        padding: const EdgeInsets.all(10),
                        child: Text("Hourly"),
                      )
                    ],
                  ),

                  Expanded(
                      child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        color: Colors.orange,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Text("11h"),
                            BoxedIcon(
                              WeatherIcons.rain_mix,
                              size: 30.0,
                              color: Colors.orange,
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
                                            fontSize: 13.0, color: Colors.blue),
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
                                        fontSize: 18.0, color: Colors.blue),
                                    children: [
                                  TextSpan(text: "°"),
                                ]))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.orange,
                        child: Column(
                          children: <Widget>[
                            Text("11h"),
                            BoxedIcon(
                              WeatherIcons.rain_mix,
                              size: 30.0,
                              color: Colors.orange,
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
                                            fontSize: 13.0, color: Colors.blue),
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
                                        fontSize: 18.0, color: Colors.blue),
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
                              size: 30.0,
                              color: Colors.orange,
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
                                            fontSize: 13.0, color: Colors.blue),
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
                                        fontSize: 18.0, color: Colors.blue),
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
                              size: 30.0,
                              color: Colors.orange,
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
                                            fontSize: 13.0, color: Colors.blue),
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
                                        fontSize: 18.0, color: Colors.blue),
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
                              size: 30.0,
                              color: Colors.orange,
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
                                            fontSize: 13.0, color: Colors.blue),
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
                                        fontSize: 18.0, color: Colors.blue),
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
                              size: 30.0,
                              color: Colors.orange,
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
                                            fontSize: 13.0, color: Colors.blue),
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
                                        fontSize: 18.0, color: Colors.blue),
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
                              size: 30.0,
                              color: Colors.orange,
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
                                            fontSize: 13.0, color: Colors.blue),
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
                                        fontSize: 18.0, color: Colors.blue),
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
                              size: 30.0,
                              color: Colors.orange,
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
                                            fontSize: 13.0, color: Colors.blue),
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
                                        fontSize: 18.0, color: Colors.blue),
                                    children: [
                                  TextSpan(text: "°"),
                                ]))
                          ],
                        ),
                      ),
                    ],
                  )),
                  // hang ngay
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Hang ngay"),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                        child: new ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                size: 30.0,
                                color: Colors.orange,
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
                                              color: Colors.blue),
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
                                          fontSize: 18.0, color: Colors.blue),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.yellowAccent,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Text("11h"),
                              BoxedIcon(
                                WeatherIcons.rain_mix,
                                size: 30.0,
                                color: Colors.orange,
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
                                              color: Colors.blue),
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
                                          fontSize: 18.0, color: Colors.blue),
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
                                size: 30.0,
                                color: Colors.orange,
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
                                              color: Colors.blue),
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
                                          fontSize: 18.0, color: Colors.blue),
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
                                size: 30.0,
                                color: Colors.orange,
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
                                              color: Colors.blue),
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
                                          fontSize: 18.0, color: Colors.blue),
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
                                size: 30.0,
                                color: Colors.orange,
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
                                              color: Colors.blue),
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
                                          fontSize: 18.0, color: Colors.blue),
                                      children: [
                                    TextSpan(text: "°"),
                                  ]))
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                  // Row(
                  //   children: <Widget>[
                  //     Padding(
                  //         padding: const EdgeInsets.all(10),
                  //         child: Text("Chi tiet")),
                  //   ],
                  // ),
                  // Expanded(
                  //   child: ListView(
                  //     children: <Widget>[
                  //       ListTile(
                  //         title: Text("Chi so UV"),
                  //         leading: BoxedIcon(WeatherIcons.raindrop),
                  //         trailing: Text("Rat cao"),
                  //       ),
                  //       ListTile(
                  //         title: Text("Chi so UV"),
                  //         leading: BoxedIcon(WeatherIcons.raindrop),
                  //         trailing: Text("Rat cao"),
                  //       ),
                  //       ListTile(
                  //         title: Text("Chi so UV"),
                  //         leading: BoxedIcon(WeatherIcons.raindrop),
                  //         trailing: Text("Rat cao"),
                  //       ),
                  //       ListTile(
                  //         title: Text("Chi so UV"),
                  //         leading: BoxedIcon(WeatherIcons.raindrop),
                  //         trailing: Text("Rat cao"),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              )),
            ),
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
                leading: BoxedIcon(
                  WeatherIcons.night_alt_hail,
                  color: Colors.orange,
                ),
                title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                leading: Icon(Icons.contacts),
                title: Text("Contact Us"),
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
