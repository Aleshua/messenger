import 'package:flutter/material.dart';

const Color colorText = Color.fromARGB(100, 255, 255, 255);
const double sizeText = 12;

class DateLastMessage extends StatefulWidget{
  DateTime date;
  DateLastMessage({required this.date, super.key});

  @override
  _DateLastMessageState createState() => _DateLastMessageState(date: date);
}

class _DateLastMessageState extends State<DateLastMessage> {
  DateTime date;
  _DateLastMessageState({required this.date});

  @override
  Widget build(BuildContext context) {
    String text;
    if (EqualityCheck(DateTime.now(), date)) {
      text = '${date.hour}.${date.minute}';
    } else if (CheckForThisWeek(date)) {
      text = '${GetDay(date.weekday)}';
    } else {
      text = '${date.day} ${GetMonth(date.month)}';
    }
    return Text(text,
        style: const TextStyle(
            fontSize: sizeText,
            color: colorText,
          ),
      );
  }
}

bool EqualityCheck(DateTime date1, DateTime date2){
  if ((date1.year == date2.year) & (date1.month == date2.month) & (date1.day == date2.day)) {
    return true;
  }
  return false;
}

bool CheckForThisWeek(DateTime date){
  DateTime now = DateTime.now();
  if ((now.year == date.year) & (now.month == date.month)) {
    if ((now.weekday > date.weekday) & ((now.day - date.day) < DateTime.daysPerWeek)) {
      return true;
    }
  }
  return false;
}

String? GetDay(int date) {
  var dayData = { 1: "Mon", 2: "Tue", 3: "Wed", 4: "Thur", 5: "Fri", 6: "Sat", 7: "Sun" };
  return dayData[date];
}

String? GetMonth(int date) {
  var monthData = { 1: "Jan", 2: "Feb", 3: "Mar", 4: "Apr", 5: "May", 6: "June", 7: "Jul", 8: "Aug", 9: "Sep", 10: "Oct", 11: "Nov", 12: "Dec" };
  return monthData [date];
}