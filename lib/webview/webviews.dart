import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample1 extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample1> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl:
          'https://dev.shuiiing.kr/api/v1/maps/location/map/?lat=37.54699&lon=127.09598',
      javascriptMode: JavascriptMode.unrestricted,
      key: Key("webview1"),
    );
  }
}

// step 1  android/app/build.gradle: => minSdkVersion 19

/**
 * 
 * ios/Runner/info.plist
 *  

<key>NSAppTransportSecurity</key>

<dict>

<key>NSAllowsArbitraryLoads</key>

<true/>

</dict>
 */

//Step 2 AndoridManifest.xml

/**    android:usesCleartextTraffic="true" */
