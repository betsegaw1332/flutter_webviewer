import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late WebViewController _webViewController;

  @override
  void initState() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://google.com'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: WebViewWidget(controller: _webViewController));
  }
}
