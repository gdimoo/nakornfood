
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class MyWebview extends StatefulWidget {
  @override
  _MyWebviewState createState() => _MyWebviewState();
}

class _MyWebviewState extends State<MyWebview> {
  
  String url1="https://alligator.io";
  String url2="https://nakornfood.pythonanywhere.com/ar";
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
   Widget build(BuildContext context) {
    // return 
return Scaffold(
      appBar: AppBar(
        title: const Text('Wikipedia Explorer'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        // actions: <Widget>[
        //   NavigationControls(_controller.future),
        //   Menu(_controller.future, () => _favorites),
        // ],
      ),
      body: WebView(
        initialUrl: 'https://en.wikipedia.org/wiki/Kraken',
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
      // floatingActionButton: _bookmarkButton(),
    );
  //   MaterialApp(home:Scaffold(
  //     appBar: AppBar(
  //       title:Text("hello")),
  //       body:showweb(url1)));
  // }
  // Widget showweb(String weburl){
  //   return WebView(
  //         // initialUrl: "https://nakornfood.pythonanywhere.com/ar",
  //         initialUrl: url1,
  //         javascriptMode: JavascriptMode.unrestricted,);
  }
}
// class MyWebView extends StatelessWidget {

//   final Completer<WebViewController> _controller =
//       Completer<WebViewController>();

//   String url1="https://alligator.io";
//   String url2="https://nakornfood.pythonanywhere.com/ar";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:Text("hello")),
//         body:Showweb(url1));
//   }
//   Widget Showweb(String weburl){
//     return WebView(
//           // initialUrl: "https://nakornfood.pythonanywhere.com/ar",
//           initialUrl: url1,
//           javascriptMode: JavascriptMode.unrestricted,);
//   }
// }