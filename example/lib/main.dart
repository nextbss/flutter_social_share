import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_social_share/flutter_social_share.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Share to Facebook'.toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => FlutterSocialShare()
                      .shareLinkToFacebook('https://nextbss.co.ao')),
              MaterialButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Tweet'.toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () =>
                      FlutterSocialShare().tweet('https://nextbss.co.ao')),
            ],
          ),
        ),
      ),
    );
  }
}
