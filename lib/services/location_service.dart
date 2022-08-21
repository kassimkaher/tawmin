import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

getLocationPermition({required Function(bool isGranted) onResult}) async {
  var status = await Permission.location.status;
  if (status.isDenied) {
    var result = await requestPermition(Permission.location);

    if (result) {
      if (await isEnable()) {
        onResult(true);
      }
    }

    return;
  } else {
    if (await isEnable()) {
      onResult(true);
      return;
    }
    onResult(false);
  }
}

Future<bool> requestPermition(Permission permission) async {
  Map<Permission, PermissionStatus> statuses = await [permission].request();
  var status = false;

  if (statuses[permission] == PermissionStatus.granted) {
    status = true;
  }

  return status;
}

Future<bool> isEnable() async {
  var status = false;
  if (!(await Permission.locationWhenInUse.serviceStatus.isEnabled)) {
    await Geolocator.openLocationSettings();
  }

  status = await Permission.locationWhenInUse.serviceStatus.isEnabled;

  return status;
}
