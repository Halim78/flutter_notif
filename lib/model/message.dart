import 'package:flutter/material.dart';

@immutable
class Message {
  final String? title;
  final String? body;

  const Message({required this.title, required this.body});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      title: json['title'],
      body: json['body'],
    );
  }
}
