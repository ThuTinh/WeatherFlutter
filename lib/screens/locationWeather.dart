import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LocationWeather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LocationState();
  }
}

class LocationState extends State<LocationWeather> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "add location",
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
        ),
        body: Container(
            color: Colors.white,
            height: MediaQuery.of(context).copyWith().size.height,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
               crossAxisAlignment: CrossAxisAlignment.center,
             
                children: <Widget>[
                  Container(
                    height: 40.0,
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      style:  TextStyle(color: Colors.black),
                      decoration: InputDecoration(border: OutlineInputBorder(),  hintText: 'Enter location'),
                       autofocus: true,
                       controller: myController,
                    ),
                  ),
                  RaisedButton(
                      child: Text("View Weather"),
                      onPressed: () {
                        Navigator.pop(context, myController.text);
                      })
                ],
              ),
            )));
  }
}
