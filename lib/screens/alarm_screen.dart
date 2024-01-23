

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarms'),
        actions: [
          PopupMenuButton(itemBuilder: (context)=><PopupMenuEntry<String>>[
            PopupMenuItem(
              value: 'settings',
              child: Text('Settings'))
          ])
        ],
      ),
    body: ListView.builder(
      itemCount: 3,
      itemBuilder: (context,index){
        return Card(
          child: ListTile(
            title: Text('Time'),
            subtitle: Text('day| time'),
            trailing: Icon(Icons.circle_outlined),
            onTap: (){
              EnableAlarm;
            },
          ),
        );
        
      })

    );
  }
}


class EnableAlarm extends StatefulWidget {
  const EnableAlarm({super.key});

  @override
  State<EnableAlarm> createState() => _EnableAlarmState();
}

class _EnableAlarmState extends State<EnableAlarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 500,
      color: Colors.green,
    );
  }
}