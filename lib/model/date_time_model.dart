
class DateTimeModel {
  String? time;
  String? date;
  bool isTapped;

  DateTimeModel({this.time, this.date, this.isTapped = false});

  factory DateTimeModel.fromJson(Map<String, dynamic>json){
    return DateTimeModel(
      time: json['time'],
      date: json['date']
    );
  }
}
