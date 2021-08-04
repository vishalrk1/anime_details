import 'dart:io';

import 'package:anime_search/values/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  static const routName = '/web-screen';
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final url = ModalRoute.of(context)!.settings.arguments as String;
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: darkColor,
        title: Text("Animezz", style: Theme.of(context).textTheme.headline6),
        iconTheme: IconThemeData(
          color: yelloColor,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: yelloColor,
        ),
      ),
      url: url,
      withZoom: true,
      initialChild: Center(
        child: CircularProgressIndicator(
          color: yelloColor,
        ),
      ),
    );
  }
}
