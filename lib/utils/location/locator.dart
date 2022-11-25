import 'package:geolocator/geolocator.dart';

Future<Position> determinePosition() async {
  late bool serviceEnabled;

  LocationPermission perms;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled');
  }

  perms = await Geolocator.checkPermission();
  if (perms == LocationPermission.denied) {
    perms = await Geolocator.requestPermission();

    if (perms == LocationPermission.denied) {
      return Future.error('Location permissions denied');
    }
  }

  if (perms == LocationPermission.deniedForever) {
    return Future.error(
        'Location Permissions are permenantly denied, we cannot request permissions');
  }

  return await Geolocator.getCurrentPosition();
}
