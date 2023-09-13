import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DialogHelper {
  static void showInfoDialog(BuildContext context, String message, String url) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text(
                        url,
                        style: const TextStyle(fontSize: 12),
                      ),
                      leading: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    body: InAppWebView(
                      initialUrlRequest: URLRequest(url: Uri.parse(url)),
                      onWebViewCreated: (InAppWebViewController controller) {},
                    ),
                  ),
                ),
              );
            },
            child: const Text('Open'),
          ),
        ],
      ),
    );
  }
}
