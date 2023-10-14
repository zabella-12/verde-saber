import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatBot'),
      ),
      body: WebView(
        initialUrl: 'https://mediafiles.botpress.cloud/1cf3cc92-ce9b-4b62-b783-a54ff97822ed/webchat/bot.html',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
