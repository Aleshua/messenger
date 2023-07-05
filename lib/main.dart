import 'package:flutter/material.dart';
import 'package:messenger/test/test.dart';
import 'package:messenger/widget/chat_list.dart';
import 'package:messenger/widget/search_page.dart';

import 'model/chat.dart';

Color colorBackground = const Color.fromARGB(255, 23, 33, 43);
Color colorBackgroundAppBar = const Color.fromARGB(255, 37, 47, 61);

const Color colorText = Colors.white;
const Color colorButton = Colors.white;

const double sizeIcon = 30.0;
const double sizeText = 30;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final List<Chat> chats = await LoadChats();
  runApp(MyApp(chats: chats,));
}

class MyApp extends StatelessWidget {
  List<Chat> chats;

  MyApp({required this.chats, super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(chats: chats,),
    );
  }
}

class HomePage extends StatefulWidget{
  List<Chat> chats;

  HomePage({required this.chats, super.key});
  @override
  _HomePageState createState() => _HomePageState(chats: chats);
}

class _HomePageState extends State<HomePage> {
  List<Chat> chats;

  _HomePageState({required this.chats});
  @override
  Widget build(BuildContext context) {
    chats = ClearChats(chats);
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: colorBackgroundAppBar,
        leading: const IconButton(icon: Icon(Icons.menu, color: colorButton,),
          iconSize: sizeIcon,
          color: Colors.white,
          onPressed: null,
        ),
        title: const Text('Chats',
            style: TextStyle(
              fontSize: sizeText,
              color: colorText,
              fontWeight: FontWeight.bold,
            ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: colorButton,),
            iconSize: sizeIcon,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchPage(chats: chats,))),
          ),
        ],
      ),
      body:  ChatList(chats: chats,),
    );
  }

  List<Chat> ClearChats(List<Chat> list){
    List<Chat> newList = [];
    for (var x in list){
      if (x.lastMessage != null) {
        newList.add(x);
      }
    }
    return newList;
  }
}
