import 'dart:developer';
import 'dart:core';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notification_push/model/message.dart';

class MessagingWidget extends StatefulWidget {
  const MessagingWidget({Key? key}) : super(key: key);

  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final List<Message> messages = [];
  // bool _initialized = false;
  // bool _error = false;

  // void initializeFlutterFire() async {
  //   try {
  //     // Wait for Firebase to initialize and set `_initialized` state to true
  //     await Firebase.initializeApp();
  //     setState(() {
  //       _initialized = true;
  //       inspect(_initialized);
  //     });
  //   } catch (e) {
  //     // Set `_error` state to true if Firebase initialization fails
  //     setState(() {
  //       _error = true;
  //       inspect(_error);
  //     });
  //   }
  // }

  @override
  void initState() {
    // initializeFlutterFire();
    super.initState();

    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        inspect(message);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //Notif lors de l'utilisation de la notif
      if (message.notification != null) {
        setState(() {
          messages.add(Message(
            title: message.notification?.title,
            body: message.notification?.body,
          ));
        });
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //Notif lorsque l'application est en fond
    });

    _firebaseMessaging.requestPermission(sound: true, badge: true, alert: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: messages.map(buildMessage).toList(),
    ));
  }

  Widget buildMessage(Message message) => ListTile(
        title: Text(message.title.toString()),
        subtitle: Text(message.body.toString()),
      );
}
