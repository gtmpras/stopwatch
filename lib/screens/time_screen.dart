
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentTime extends StatefulWidget {
  const CurrentTime({super.key});

  @override
  State<CurrentTime> createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  late DateTime _currentTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Initilize the current time
    _currentTime = DateTime.now();

    //Start updating the time every seconds
    _updateTime();
  }

  //update time every second
  void _updateTime(){
    setState(() {
      _currentTime = DateTime.now();
    });

    //schedule next update after 1 second
    Future.delayed(Duration(seconds: 1),_updateTime);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Time'),
      ),
    body: Column(
     mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              Text('${DateFormat('jms').format(_currentTime)}',style: TextStyle(
                fontSize: 50
              ),),
              Text('${DateFormat('yMMMd').format(_currentTime)}'),
            ],
          ),
          
        )
      ],
    ),
    );
  }
}