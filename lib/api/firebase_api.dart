import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('FCM Token: $fCMToken');
    initPushNotification();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    NavigationKey.currentState?.pushNamed(
      '/notification_screen',
      arguments: message,
    );
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then((handleMessage));

    FirebaseMessaging.onMessageOpenedApp.listen((handleMessage));
  }
}
