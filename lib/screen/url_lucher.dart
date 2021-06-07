import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

class KakaoMapLaucher extends StatefulWidget {
  @override
  _KakaoMapLaucherState createState() => _KakaoMapLaucherState();
}

class _KakaoMapLaucherState extends State<KakaoMapLaucher> {
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    var lastPosition = await Geolocator.getLastKnownPosition();

    // print(lastPosition);
    var lat = position.latitude;
    var long = position.longitude;

    var des_lat = "35.0986474";
    var des_lon = "129.019162";

    _launchURL(lat, long, des_lat, des_lon);
  }

  void _launchURL(s_lat, s_lon, d_lat, d_lon) async {
    String url =
        "kakaomap://route?sp=${s_lat},${s_lon}&ep=${d_lat},${d_lon}8&by=CAR";
    //String register = "kakaomap://route?";
    if (await canLaunch("kakaomap://open?page=placeSearch")) {
      await launch(url);
    } else {
      StoreRedirect.redirect(
          androidAppId: "net.daum.android.map", iOSAppId: "304608425");
      // LaunchReview.launch(
      //     androidAppId: "net.daum.android.map", iOSAppId: "304608425");
    }
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kakao Map + Call"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
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
                "Open KaKao Maps",
              ),
            ),
            SizedBox(height: 20.0),
            FlatButton(
              onPressed: () async {
                // AppSettings.openAppSettings();
                await launch("tel:010-9926-7403");
                print("1234");
              },
              child: Text(
                "Call Number",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
