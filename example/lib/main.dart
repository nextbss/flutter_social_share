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
          child: MaterialButton(
            color: Theme.of(context).primaryColor,
            child: Text('Click-me'),
            onPressed: () => FlutterSocialShare()
                .shareLinkToFacebook('https://nextbss.co.ao')
          ),
        ),
      ),
    );
  }
}
