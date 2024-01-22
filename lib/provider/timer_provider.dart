import 'dart:async';
import 'package:flutter/foundation.dart';

class TimerProvider with ChangeNotifier {
  List laps = [];
  late Timer _timer;
  int _hour = 0;
  int _minute = 0;
  int _seconds = 0;
  int _milliseconds =0;
  bool _startEnable = true;
  bool _stopEnable = false;
  bool _resetEnable = false;

  int get hour => _hour;
  int get minute => _minute;
  int get seconds => _seconds;
  int get milliseconds => _milliseconds;
  bool get startEnable => _startEnable;
  bool get stopEnable => _stopEnable;
  bool get resetEnable => _resetEnable;

  void startTimer() {
    _startEnable = false;
    _stopEnable = true;
  
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      _milliseconds +=100;
      if(_milliseconds >=1000){
        _milliseconds = 0;
        if (_seconds < 59) {
        _seconds++;
      } else {
        _seconds = 0;
        if (_minute < 59) {
          _minute++;
        } else {
          _minute = 0;
          _hour++;
        }
      }
    }  
      notifyListeners();
    });
  }

  void stopTimer() {
    _startEnable = true;
    _stopEnable = false;
    _timer.cancel();
    notifyListeners();
  }

  void resetTimer(){
    _startEnable = true;
    _stopEnable = false;
    _hour =0;
    _minute = 0;
    _seconds = 0;
    _milliseconds = 0;
    //cancel the existing timer if it's running
    laps.clear();
    if(_timer.isActive){
      _timer.cancel();
    }
    notifyListeners();
  }

  void addlaps(){
    String lap = "$hour:$minute:$seconds:$milliseconds";
    laps.add(lap);
    notifyListeners();
  }
}
