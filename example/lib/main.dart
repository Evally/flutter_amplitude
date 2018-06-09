import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_amplitude/flutter_amplitude.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  initState() {
    super.initState();
    init();
  }

  init() async {

    FlutterAmplitude.init("your_apy_key", true);
    FlutterAmplitude.addGeneralProperties({'generalParameterKey': 'generalParameterValue'});
    FlutterAmplitude.setUserId("info@sample.com");
    FlutterAmplitude.setUserProperties({'userParameterKey': 'userParameterValue'});
    FlutterAmplitude.logEvent("EVENT_KEY", {'eventParameterKey': 'eventParameterValue'});

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
      ),
    );
  }
}
