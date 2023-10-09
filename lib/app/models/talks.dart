import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_to_do_list/app/theme/colors/light_colors.dart';

class TalksModel {
  int? id;
  String? title;
  String? description;
  DateTime? date;
  DateTime? StartTime;
  DateTime? EndTime;
  int? categoriaId;
  Color? background;
  bool? isAllDay;

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

  // Construtor para criar uma instância com cor aleatória
  factory TalksModel.withRandomColor({
    String? title,
    String? description,
    DateTime? date,
    DateTime? StartTime,
    DateTime? EndTime,
    int? categoriaId,
    bool? isAllDay,
  }) {
  

    return TalksModel(
      background: LightColors.getRandomColor(),
      isAllDay: isAllDay ?? false,
      title: title ?? '',
      description: description ?? '',
      date: date,
      StartTime: StartTime,
      EndTime: EndTime,
      categoriaId: categoriaId ?? 0,
    );
  }

  Map<String, Object> toMap() {
    return {
      // 'id': id!,
      'background': background!.value,
      'isAllDay': isAllDay!,
      'title': title!,
      'description': description!,
      'date': date.toString() ?? '',
      'StartTime': StartTime.toString() ?? '',
      'EndTime': EndTime.toString() ?? '',
      'categoriaId': categoriaId!,
    };
  }

  // Método para desserializar o JSON em um objeto TalksModel
  factory TalksModel.fromMap(Map<String, dynamic> map) {
    return TalksModel(
      background: Color(map['background'] ?? Colors.black),
      isAllDay: map['isAllDay'] == 1,
      id: map['id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] != null ? DateTime.tryParse(map['date']) : null,
      StartTime:
          map['StartTime'] != null ? DateTime.tryParse(map['StartTime']) : null,
      EndTime:
          map['EndTime'] != null ? DateTime.tryParse(map['EndTime']) : null,
      categoriaId: map['categoriaId']?.toInt() ?? 0,
    );
  }

  // Método para serializar o objeto em JSON como uma string
  String toJson() => json.encode(toMap());

  // Método para desserializar o JSON em um objeto TalksModel a partir de uma string JSON
  factory TalksModel.fromJson(String source) =>
      TalksModel.fromMap(json.decode(source));
}
