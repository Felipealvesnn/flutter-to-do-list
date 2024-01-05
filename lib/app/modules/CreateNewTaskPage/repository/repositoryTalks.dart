import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_to_do_list/app/Constants/nameDbs.dart';
import 'package:flutter_to_do_list/app/data/db.ultil.commum.dart';
import 'package:flutter_to_do_list/app/data/db.util.dart';
import 'package:flutter_to_do_list/app/models/category.dart';
import 'package:flutter_to_do_list/app/models/talks.dart';

class RepositoryTalks {
  static late DatabaseInstanceProvider _databaseInstance;
  static Future<void> addTask(TalksModel talksModel) async {
    try {
      await _databaseInstance.insert(NomeBanco.talks, talksModel.toMap());
    } catch (e) {
      print(e);
    }
  }

  static Future<List<TalksModel>> getTalks() async {
    var result = await _databaseInstance.getData(NomeBanco.talks);
    //var result = await getDatabaseInstance().getData(NomeBanco.talks);
    final mapList = result.map((e) {
      return TalksModel.fromMap(e);
    }).toList();
    return mapList;
  }

  static Future<List<Category>> getCategories() async {
    var result = await _databaseInstance.getData(NomeBanco.category);
    //final result = await getDatabaseInstance().getData(NomeBanco.category);
    final mapList = result.map((e) => Category.fromMap(e)).toList();

    if (mapList.isEmpty) {
      await addDefaultCategories();
      final updatedResult = await _databaseInstance.getData(NomeBanco.category);
      mapList.addAll(updatedResult.map((e) => Category.fromMap(e)));
    }

    return mapList;
  }

  static Future<void> deleteTalk(TalksModel talksModel) async {
    try {
      await _databaseInstance.delete(
          NomeBanco.talks, talksModel.id!.toString());
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
        await _databaseInstance.insert(NomeBanco.category, category);
      } catch (e) {
        print(e);
      }
    }
  }

  static Future<DatabaseInstanceProvider> getDatabaseInstance() async {
    if (Platform.isWindows) {
      _databaseInstance = DatabaseHelper();
      await _databaseInstance.openDatabase();
      return _databaseInstance;
    } else {
      _databaseInstance = DbUtil();
      
      return _databaseInstance;
    }
  }
}

abstract class DatabaseInstanceProvider {
  Future<void> openDatabase();
  Future<List<Map<String, dynamic>>> getData(String tablem);
  Future<void> insert(String table, Map<String, Object> data);
  Future<void> edit(
      String table, String id, Map<String, dynamic> valuesToUpdate);
  Future<void> delete(String table, String id);
  Future<void> closeDatabase();
}
