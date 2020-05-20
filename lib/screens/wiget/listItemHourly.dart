import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_icons/weather_icons.dart';

import 'package:app_demo/model/weather.dart';

class ListItemHourly extends StatelessWidget {
 final Weather weather ;

  const ListItemHourly({
    Key key,
    this.weather,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text('${weather.dtTxt.hour} : ${weather.dtTxt.minute}'),
          // BoxedIcon(
          //   WeatherIcons.rain_mix,
          //   color: Hexcolor("#757575"),
          //   size: 30.0,
          // ),
          Image.network('http://openweathermap.org/img/wn/${weather != null?weather.weather[0].icon:'04n'}@2x.png'),
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
                      text: '${weather.main.humidity}',
                      style: TextStyle(
                        fontSize: 13.0,
                      ),
                      children: [TextSpan(text: "%")]))
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          RichText(
              text: TextSpan(
                  text: '${  weather != null?(weather.main.temp -273).toStringAsFixed(1):0}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  children: [
                TextSpan(text: "°"),
              ]))
        ],
      ),
    );
  }
}
