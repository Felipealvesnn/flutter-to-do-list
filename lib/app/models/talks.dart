import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

class TalksModel {
  int? id;
  String? title;
  String? description;
  DateTime? date;
  DateTime? StartTime;
  DateTime? EndTime;
  int? categoriaId;
  Color? background = Colors.blue;
  bool? isAllDay = false;

  TalksModel({
    this.background,
    this.isAllDay,
    this.id,
    this.title,
    this.description,
    this.date,
    this.StartTime,
    this.EndTime,
    this.categoriaId,
  });

  Map<String, Object> toMap() {
    return {
      // 'id': id!,
      'background': background!.value,
      'isAllDay': isAllDay!,
      'title': title!,
      'description': description!,
      'date': date!.toString(),
      'StartTime': StartTime!.toString(),
      'EndTime': EndTime!.toString(),
      'categoriaId': categoriaId!,
    };
  }

  factory TalksModel.fromMap(Map<String, dynamic> map) {
    return TalksModel(
      background: Color(map['backgroundValue'] ?? Colors.black), 
      isAllDay: map['isAllDay'] ?? false,
      id: map['id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
      StartTime:
          map['StartTime'] != null ? DateTime.parse(map['StartTime']) : null,
      EndTime: map['EndTime'] != null ? DateTime.parse(map['EndTime']) : null,
      categoriaId: map['categoriaId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TalksModel.fromJson(String source) =>
      TalksModel.fromMap(json.decode(source));
}
