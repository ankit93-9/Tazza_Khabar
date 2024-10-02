
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class Detail_view extends StatefulWidget {

   String newsUrl;

    Detail_view({super.key , required this.newsUrl});

  @override
  State<Detail_view> createState() => _Detail_viewState();
}

class _Detail_viewState extends State<Detail_view> {

  @override
  void initState() {
    
    super.initState();

    setState(() {
      widget.newsUrl = widget.newsUrl.contains("http:")
          ? widget.newsUrl.replaceAll("http:", "https:")
          : widget.newsUrl;
    });
  }
    final Completer<WebViewController> controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: const Text("Tazza Khabar"),
      ),
      body: WebView(
        initialUrl: widget.newsUrl ,
        javascriptMode: JavascriptMode.unrestricted,

          onWebViewCreated: (WebViewController webViewController) {
            setState(() {
              controller.complete(webViewController);
            });
          }
      )
      );

    
  }
}
