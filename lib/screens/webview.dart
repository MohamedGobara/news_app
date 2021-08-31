import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview extends StatefulWidget {
  late final String url;

  webview(this.url);

  @override
  _xebvireState createState() => _xebvireState();
}

class _xebvireState extends State<webview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}
