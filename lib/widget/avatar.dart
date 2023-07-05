import 'dart:math';

import 'package:flutter/material.dart';

const double sizeText = 15;
const Color colorText = Colors.black;

class Avatar extends StatefulWidget{
  String? userAvatar;
  String userName;
  Avatar({this.userAvatar, required this.userName, super.key});

  @override
  _AvatarState createState() => _AvatarState(userAvatar: userAvatar, userName: userName);
}

class _AvatarState extends State<Avatar> {
  String? userAvatar;
  String userName;

  Random random = Random();
  _AvatarState({this.userAvatar, required this.userName});

  @override
  Widget build(BuildContext context) {
    if (userAvatar != null) {
      return CircleAvatar(
          backgroundImage: ExactAssetImage(userAvatar!),
      );
    }
    else {
      return Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255)),
                    Colors.white,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
              )
          ),
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Text(
                  userName[0],
                  style: const TextStyle(
                      color: colorText
                  )
              )
          )
      );
    }
  }
}