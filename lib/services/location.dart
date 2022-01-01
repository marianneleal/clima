import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Location({this.latitude, this.longitude});

  Future<void> getCurrentLocation() async {
    try {
      Position currentPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = currentPosition.latitude;
      longitude = currentPosition.longitude;

      print(currentPosition);
    } catch (e) {
      print(e);
    }
  }
}
