import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const WFESCApp());
}

class WFESCApp extends StatelessWidget {
  const WFESCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WFESC',
      theme: ThemeData.dark(),
      home: const WFESCWebView(),
    );
  }
}

class WFESCWebView extends StatefulWidget {
  const WFESCWebView({super.key});

  @override
  State<WFESCWebView> createState() => _WFESCWebViewState();
}

class _WFESCWebViewState extends State<WFESCWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset('assets/web/index.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
