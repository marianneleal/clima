import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = new WeatherModel();
    var weatherData = weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitRipple(
        color: Colors.yellow,
        size: 200.0,
      )),
    );
  }
}
