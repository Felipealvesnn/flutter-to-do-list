
import 'dart:convert';
import 'dart:ffi';

class TalksModel {
  int? id;
  String? title;
  String? description;
  String? date;
  String? StartTime;
  String? EndTime;
  int? categoriaId;
  
  TalksModel({
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
      'id': id!,
      'title': title!,
      'description': description!,
      'date': date!,
      'StartTime': StartTime!,
      'EndTime': EndTime!,
      'categoriaId': categoriaId!,
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
