import 'package:flutter/material.dart';
import 'package:messenger/widget/avatar.dart';
import 'package:messenger/widget/unread_messages.dart';
import '../model/chat.dart';
import 'date_last_message.dart';

Color colorBackground = const Color.fromARGB(255, 29, 44, 61);
const Color colorText = Colors.white;

const double sizeTextTitle = 20.0;
const double sizeTextSubtitle = 15.0;

class ChatContainer extends StatefulWidget{
  Chat chat;
  ChatContainer({required this.chat, super.key});

  @override
  _ChatContainerState createState() => _ChatContainerState(chat: chat,);
}

class _ChatContainerState extends State<ChatContainer> {
  Chat chat;
  _ChatContainerState({required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: colorBackground,
      textColor: colorText,
      leading: Avatar(userAvatar: chat.userAvatar, userName: chat.userName,),
      title: Text(chat.userName,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
          fontSize: sizeTextTitle,
          color: colorText,
        ),
      ),
      subtitle: Text(chat.lastMessage!,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
          fontSize: sizeTextSubtitle,
          color: colorText,
        ),
      ),
      trailing: Column(
        children: <Widget>[
          DateLastMessage(date: chat.date!,),
          const SizedBox(height: 10),
          UnreadMessages(chat: chat,),
        ],
      ),
      onTap: null,
    );
  }
}