import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/repository/repositoryTalks.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../Constants/nameDbs.dart';

class DatabaseHelper implements DatabaseInstanceProvider {
  static late Database _database;

  @override
  Future<void> openDatabase() async {
    final List<String> testes = Query();
    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfi;
    _database = await databaseFactory.openDatabase(inMemoryDatabasePath);

    await _database.execute(testes[0]);
    await _database.execute(testes[1]);
  }

  @override
  Future<int> insert(String table, Map<String, Object> data) async {
    try {
      return await _database.insert(
        table,
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Erro ao inserir os dados: $e");
      return -1; // Retorna um valor negativo para indicar erro
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getData(String table) async {
    return await _database.query(table);
  }

  @override
  Future<int> edit(
      String table, String id, Map<String, dynamic> valuesToUpdate) async {
    return await _database.update(
      table,
      valuesToUpdate,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<int> delete(String table, String id) async {
    return await _database.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> closeDatabase() async {
    await _database.close();
  }
}
