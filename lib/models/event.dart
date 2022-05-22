import 'dart:convert';

import 'package:intl/intl.dart';

class EventModel {
  String? title;
  String? description;
  DateTime? dateTime;

  EventModel({
    this.title,
    this.description,
    this.dateTime,
  });

  EventModel.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    dateTime = DateFormat().parse(json['date_time']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['date_time'] = DateFormat().format(dateTime!);
    return map;
  }

  @override
  String toString() {
    final event =
        EventModel(title: title, description: description, dateTime: dateTime);
    return json.encode(event.toJson());
  }

  EventModel toModel(String str) {
    return EventModel.fromJson(json.decode(str));
  }
}
