import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VLibrasScreen extends StatefulWidget {
  @override
  _VLibrasScreenState createState() => _VLibrasScreenState();
}

class _VLibrasScreenState extends State<VLibrasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VLibras Integration'),
      ),
      body: WebView(
        initialUrl: 'URL_DO_VLIBRAS', // Substitua pela URL real do VLibras
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
