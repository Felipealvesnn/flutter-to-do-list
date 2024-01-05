import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_to_do_list/app/Constants/nameDbs.dart';
import 'package:flutter_to_do_list/app/data/db.ultil.commum.dart';
import 'package:flutter_to_do_list/app/data/db.util.dart';
import 'package:flutter_to_do_list/app/models/category.dart';
import 'package:flutter_to_do_list/app/models/talks.dart';

class RepositoryTalks {
  static Future<void> addTask(TalksModel talksModel) async {
    try {
      await _getDatabaseInstance().insert(NomeBanco.talks, talksModel.toMap());
    } catch (e) {
      print(e);
    }
  }

  static Future<List<TalksModel>> getTalks() async {
    var result = await _getDatabaseInstance().getAllData(NomeBanco.talks);
    final mapList = result.map((e) {
      return TalksModel.fromMap(e);
    }).toList();
    return mapList;
  }

  static Future<List<Category>> getCategories() async {
    final result = await _getDatabaseInstance().getData(NomeBanco.category);
    final mapList = result.map((e) => Category.fromMap(e)).toList();

    if (mapList.isEmpty) {
      await addDefaultCategories();
      final updatedResult = await _getDatabaseInstance().getData(NomeBanco.category);
      mapList.addAll(updatedResult.map((e) => Category.fromMap(e)));
    }

    return mapList;
  }

  static Future<void> deleteTalk(TalksModel talksModel) async {
    try {
      await _getDatabaseInstance().delete(NomeBanco.talks, talksModel.id!.toString());
    } catch (e) {
      print(e);
    }
  }

  static Future<void> addDefaultCategories() async {
    final defaultCategories = [
      {'nome': 'Lazer', 'dataCriacao': DateTime.now().toString()},
      {'nome': 'Saude', 'dataCriacao': DateTime.now().toString()},
      {'nome': 'Comida', 'dataCriacao': DateTime.now().toString()},
    ];

    for (final category in defaultCategories) {
      try {
        await _getDatabaseInstance().insert(NomeBanco.category, category);
      } catch (e) {
        print(e);
      }
    }
  }

  static dynamic _getDatabaseInstance() {
    return kIsWeb ? DatabaseHelper : DbUtil;
  }
}
