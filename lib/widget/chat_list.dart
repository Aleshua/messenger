import 'package:flutter/material.dart';
import '../model/chat.dart';
import 'chat_conteiner.dart';

const double paddingTop = 5;
const double paddingLeft = 0;
const double paddingRight = 0;

class ChatList extends StatefulWidget{
  List<Chat> chats;

  ChatList({required this.chats, super.key});
  @override
  _ChatListState createState() => _ChatListState(chats: chats);
}

class _ChatListState extends State<ChatList> {
  List<Chat> chats;
  _ChatListState({required this.chats});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: paddingTop, left: paddingLeft, right: paddingRight),
              child: ChatContainer(chat: chats[index],),
            ),
          ],
        );
      },
    );
  }
}