import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    try {
      Location loc = Location();
      await loc.getCurrentLocation();
      latitude = loc.latitude;
      longitude = loc.longitude;

      NetworkHelper helper = NetworkHelper(
          'https://samples.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&&appid=b6907d289e10d714a6e88b30761fae22#&units=metric');

      var weatherData = await helper.getData();

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData);
      }));
    } catch (e) {}
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
