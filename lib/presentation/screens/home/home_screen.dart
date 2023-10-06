import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  double _progress = 0;
  bool _keyboardVisible = false;
  late InAppWebViewController inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    log(_keyboardVisible.toString());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: InAppWebView(
                  // gestureRecognizers: Set()
                  //   ..add(Factory<VerticalDragGestureRecognizer>(() =>
                  //       VerticalDragGestureRecognizer()
                  //         ..onDown = (details) {})),
                  initialUrlRequest: URLRequest(
                    url: Uri.parse("https://events.inspirefunclub.com/"),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    inAppWebViewController = controller;
                  },
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    setState(() {
                      _progress = progress / 100;
                    });
                  },
                ),
              ),
              _progress < 1
                  ? LinearProgressIndicator(
                      value: _progress,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool? exitApp = await showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text(
          'Are your Sure',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text('Do you want to exit the app'),
        actions: [
          TextButton(
            child: const Text(
              'Yes',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(true),
          ),
          TextButton(
            child: const Text(
              'No',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ],
      ),
    );
    return exitApp ?? false;
  }
}
