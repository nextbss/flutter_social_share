import 'dart:async';

import 'package:flutter/services.dart';

class FlutterSocialShare {
  static const MethodChannel _channel = const MethodChannel('flutter_social_share');

  Future<FacebookShareResult> shareLinkToFacebook(String contentUrl) async {
    Map<dynamic, dynamic> result = await _channel.invokeMethod(
        'shareLinkToFacebook', {'contentUrl': contentUrl});
    return FacebookShareResult._(result);
  }
}

enum FacebookShareStatus {
  success,
  cancelledByUser,
  error
}

class FacebookShareResult {
  final FacebookShareStatus status;
  final String errorMessage;

  FacebookShareResult._(Map<String, dynamic> map)
    : status = parseStatus(map['status']),
      errorMessage = map['errorMessage'];


  static FacebookShareStatus parseStatus(String status) {
    switch (status) {
      case 'success':
        return FacebookShareStatus.success;
      case 'cancelledByUser':
        return FacebookShareStatus.cancelledByUser;
      case 'error':
        return FacebookShareStatus.error;
    }

    throw StateError('Invalid status: $status');
  }
}
