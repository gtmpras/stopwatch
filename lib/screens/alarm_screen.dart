import 'dart:convert' show json;

import 'package:flutter/material.dart';

import '../model/date_time_model.dart';
class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  //  JSON data
  final List<Map<String, dynamic>> jsonDataList = [
    {
        "time": "5:00 AM",
        "date": "Tomorrow | 5 hours later"
    },
    {
        "time": "6:00 AM",
        "date": "Tomorrow | 6 hours later"
    },
    {
        "time": "5:15 AM",
        "date": "Tomorrow | 4:15 hours later"
    },
    {
        "time": "3:15 AM",
        "date": "Tomorrow | 3:15 hours later"
    }    
  ];

  List<DateTimeModel> dateTimeList = [];

  @override
  void initState() {
    super.initState();
    // Parse JSON data into DateTimeModel objects
    dateTimeList = jsonDataList.map((json) => DateTimeModel.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarms'),
        actions: [
          PopupMenuButton(itemBuilder: (context) => <PopupMenuEntry<String>>[
            PopupMenuItem(
              value: 'settings',
              child: Text('Settings'),
            )
          ]),
        ],
      ),
      body: ListView.builder(
        itemCount: dateTimeList.length,
        itemBuilder: (context, index) {
          DateTimeModel dateTime = dateTimeList[index];
          return Card(
            child: ListTile(
              title: Text(dateTime.time ?? ''),
              subtitle: Text(dateTime.date ?? ''),
              trailing: Icon(dateTime.isTapped?Icons.circle: Icons.circle_outlined ,color: dateTime.isTapped?Colors.blue:null,),
              onTap: () {
                setState(() {
                  dateTime.isTapped = ! dateTime.isTapped;
                    if (dateTime.isTapped) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Alarm added successfully!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Alarm deactivated!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                });
              
                }));
              }
              
            ),
          );
        }
  }



