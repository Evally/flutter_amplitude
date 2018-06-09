import 'dart:async';

import 'package:flutter/services.dart';

class FlutterAmplitude {
  static Map<String, String> _generalProperties = new Map();

  static const MethodChannel _channel =
      const MethodChannel('ly.eval.flutter_amplitude');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void init(String apiKey,
      [bool enableLogging = false,
      bool enableForegroundTracking = true,
      bool enableLocationListening = true]) {
    _channel.invokeMethod('initAmplitudeSDK', <String, dynamic>{
      'apiKey': apiKey,
      'enableLogging': enableLogging,
      'enableForegroundTracking': enableForegroundTracking,
      'enableLocationListening': enableLocationListening,
    });
  }

  static void addGeneralProperties(Map<String, String> properties) {
    _generalProperties.addAll(properties);
  }

  static void removeGeneralProperties(Map<String, String> properties) {
    properties.forEach((key, value) {
      _generalProperties.remove(key);
    });
  }

  static void setUserId(String userId) {
    _channel.invokeMethod('setUserId', {'userId': userId});
  }

  static void setUserProperties(Map<String, String> properties) {
    _channel.invokeMethod('setUserProperties', properties);
  }

  static void clearUserProperties() {
    _channel.invokeMethod('clearUserProperties');
  }

  static void logEvent(String eventName, [Map<String, String> arguments]) {
    Map<String, String> eventArguments = new Map();
    eventArguments.addAll({'eventName': eventName});
    eventArguments.addAll(_generalProperties);
    if (arguments != null) {
      eventArguments.addAll(arguments);
    }

    _channel.invokeMethod('logEvent', eventArguments);
  }
}
