import 'package:flutter/material.dart';

import '../model/chat.dart';

const double radius = 12;
const double sizeText = 10;
const Color colorCircle = Color.fromARGB(255, 64, 130, 188);
const Color colorText = Colors.white;

class UnreadMessages extends StatefulWidget{
  Chat chat;
  UnreadMessages({required this.chat, super.key});

  @override
  _UnreadMessagesState createState() => _UnreadMessagesState(chat: chat,);
}

class _UnreadMessagesState extends State<UnreadMessages> {
  Chat chat;

  _UnreadMessagesState({required this.chat});

  @override
  Widget build(BuildContext context) {
    if (chat.countUnreadMessages != 0) {
      return CircleAvatar(
              backgroundColor: colorCircle,
              radius: radius,
              child: Text(
                chat.countUnreadMessages.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: sizeText,
                    fontWeight: FontWeight.bold,
                    color: colorText,
                ),
              ),
            );
    }
    return const SizedBox.shrink();
  }
}