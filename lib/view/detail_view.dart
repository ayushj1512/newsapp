import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailVIewScreen extends StatefulWidget {
  String newsurl;
  DetailVIewScreen({super.key, required this.newsurl});

  @override
  State<DetailVIewScreen> createState() => _DetailVIewScreenState();
}

class _DetailVIewScreenState extends State<DetailVIewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      widget.newsurl = widget.newsurl.contains("http:")
          ? widget.newsurl.replaceAll("http:", "https:")
          : widget.newsurl;
    });
  }

  final Completer<WebViewController> controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Snack"),
      ),
      body: WebView(
        initialUrl: widget.newsurl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          setState(() {
            controller.complete(webViewController);
          });
        },
      ),
    );
  }
}
