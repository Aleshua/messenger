import 'package:flutter/material.dart';

import '../model/chat.dart';
import 'chat_list.dart';

Color colorBackground = const Color.fromARGB(255, 23, 33, 43);
Color colorBackgroundAppBar = const Color.fromARGB(255, 37, 47, 61);

const Color colorText = Colors.white;
const Color colorButton = Colors.white;

class SearchPage extends StatefulWidget{
  List<Chat> chats;

  SearchPage({required this.chats, super.key});
  @override
  _SearchPageState createState() => _SearchPageState(chats: chats);
}

class _SearchPageState extends State<SearchPage> {
  List<Chat> chats;
  List<Chat> newListChats = [];

  _SearchPageState({required this.chats});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
        appBar: AppBar(
            backgroundColor: colorBackgroundAppBar,
            title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: colorBackgroundAppBar, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none
                  ),
                  onChanged: (text){
                    setState(() {newListChats = Search(chats, text);});
                  },
                ),
              ),
            )
          ),
        body:  newListChats.isNotEmpty ? ChatList(chats: newListChats,) : const SizedBox.shrink(),
    );
  }

  List<Chat> Search(List<Chat> chats, String text){
    List<Chat> list = [];
    if (text == "") {
      return list;
    }
    for (var x in chats){
      if (x.userName.toLowerCase().startsWith(text.toLowerCase()) || x.lastMessage!.toLowerCase().startsWith(text.toLowerCase())) {
        list.add(x);
      }
    }
    return list;
  }
}