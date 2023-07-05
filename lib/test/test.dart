import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:messenger/model/chat.dart';

Future<List<Chat>> LoadChats() async {
  final rawData = jsonDecode(await rootBundle.loadString('assets/bootcamp.json'));
  List<Chat> chats = [];
  for (final item in rawData['data']) {
    chats.add(Chat.fromJson(item));
  }
  return chats;
}
