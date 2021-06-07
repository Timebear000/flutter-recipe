import 'package:flutter/material.dart';
import 'package:flutter_recipe/webview/webviews.dart';

class WebViewTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebView testing"),
      ),
      body: Container(
        color: Colors.red,
        child: Column(
          children: [
            SizedBox(height: 50),
            Text("hello WOrld"),
            Container(
              width: double.infinity,
              height: 300,
              child: WebViewExample1(),
            ),
            SizedBox(height: 50),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('뒤로가기'),
            ),
          ],
        ),
      ),
    );
  }
}
