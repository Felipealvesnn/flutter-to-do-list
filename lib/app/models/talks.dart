
import 'dart:convert';
import 'dart:ffi';

class TalksModel {
  Int id;
  String title;
  String description;
  String date;
  String StartTime;
  String EndTime;
  int categoriaId;
  
  TalksModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.StartTime,
    required this.EndTime,
    required this.categoriaId,
  });
  

  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'StartTime': StartTime,
      'EndTime': EndTime,
      'categoriaId': categoriaId,
    };
  }

  factory TalksModel.fromMap(Map<String, dynamic> map) {
    return TalksModel(
      id: map['id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
      StartTime: map['StartTime'] ?? '',
      EndTime: map['EndTime'] ?? '',
      categoriaId: map['categoriaId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TalksModel.fromJson(String source) => TalksModel.fromMap(json.decode(source));
}
