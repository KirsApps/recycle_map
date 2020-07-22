import 'package:equatable/equatable.dart';

class TimeTable extends Equatable {
  final Day monday;
  final Day tuesday;
  final Day wednesday;
  final Day thursday;
  final Day friday;
  final Day saturday;
  final Day sunday;
  TimeTable({this.monday, this.tuesday, this.wednesday, this.thursday, this.friday, this.saturday, this.sunday});
  TimeTable.fromMap(Map<String, dynamic> map)
      : monday = map.containsKey("mon") ? WorkDay().fromJson(map["mon"]) : DayOff(),
        tuesday = map.containsKey("tue") ? WorkDay().fromJson(map["tue"]) : DayOff(),
        wednesday = map.containsKey("wed") ? WorkDay().fromJson(map["wed"]) : DayOff(),
        thursday = map.containsKey("thu") ? WorkDay().fromJson(map["thu"]) : DayOff(),
        friday = map.containsKey("fri") ? WorkDay().fromJson(map["fri"]) : DayOff(),
        saturday = map.containsKey("sat") ? WorkDay().fromJson(map["sat"]) : DayOff(),
        sunday = map.containsKey("sun") ? WorkDay().fromJson(map["sun"]) : DayOff();

  @override
  List<Object> get props => [monday, tuesday, wednesday, thursday, friday, saturday, sunday];
}

abstract class Day extends Equatable {
  @override
  List<Object> get props => [];
}

class WorkDay extends Day {
  final String startTime;
  final String endTime;

  WorkDay({this.startTime, this.endTime});

  WorkDay fromJson(Map<String, dynamic> parsedJson) {
    return WorkDay(startTime: parsedJson["startTime"], endTime: parsedJson["endTime"]);
  }

  @override
  List<Object> get props => [startTime, endTime];
}

class DayOff extends Day {}
