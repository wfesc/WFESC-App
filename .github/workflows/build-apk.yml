import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  String? errorMessage;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (error) {
            setState(() {
              errorMessage =
                  'خطأ في تحميل الموقع:\n${error.description}';
            });
          },
        ),
      );

    loadWebsite();
  }

  Future<void> loadWebsite() async {
    try {
      final html = await rootBundle.loadString(
        'assets/web/index.html',
      );

      await controller.loadHtmlString(
        html,
        baseUrl: 'file:///android_asset/flutter_assets/assets/web/',
      );
    } catch (e) {
      setState(() {
        errorMessage =
            'تعذر تحميل ملف WFESC:\n$e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Scaffold(
        backgroundColor: const Color(0xFF050505),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              errorMessage!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
