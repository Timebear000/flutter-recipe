import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GeoLocationApp extends StatefulWidget {
  @override
  _GeoLocationAppState createState() => _GeoLocationAppState();
}

class _GeoLocationAppState extends State<GeoLocationApp> {
  var locationMessage = "";
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var lastPosition = await Geolocator.getLastKnownPosition();

    // print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;
    setState(() {
      locationMessage = '$lat , $long';
    });
  }

  //CheckPermission GeoLocatter
  Future<bool> checkPermission_geolocator() async {
    bool check = await Permission.location.serviceStatus.isEnabled;

    if (check) {
      return true;
    }
    Map<Permission, PermissionStatus> statues =
        await [Permission.location].request();

    bool permistterd = true;
    statues.forEach((permission, permissionStatus) {
      if (!permissionStatus.isGranted) permistterd = false;
    });

    return permistterd;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Geo Location Testing",
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 80.0,
              color: Colors.white,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Get user Location",
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            // Text()
            Text(
              locationMessage,
              style: TextStyle(color: Colors.white),
            ),
            FlatButton(
              onPressed: () async {
                // AppSettings.openAppSettings();
                if (await checkPermission_geolocator()) {
                  getCurrentLocation();
                } else {
                  AppSettings.openAppSettings();
                }
              },
              child: Text(
                "Get Current Location",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
