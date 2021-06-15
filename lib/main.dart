import 'package:flutter/material.dart';
import 'package:flutter_recipe/screen/GeoLocatorView.dart';
import 'package:flutter_recipe/screen/google_map_screen.dart';
import 'package:flutter_recipe/screen/url_lucher.dart';
import 'package:flutter_recipe/screen/webViewTest.dart';
import 'package:flutter_recipe/webview/webviews.dart';

void main() => runApp(MaterialApp(
      title: "App",
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WebViewTestScreen(),
                  ),
                );
              },
              child: Text("WebView"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GeoLocationApp(),
                  ),
                );
              },
              child: Text("GeoLocation"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => KakaoMapLaucher(),
                  ),
                );
              },
              child: Text("url_laucher"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GoogleMapScreen(),
                  ),
                );
              },
              child: Text("Google Maps Screen "),
            ),
          ],
        ),
      ),
    );
  }
}
