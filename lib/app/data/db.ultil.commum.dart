import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../Constants/nameDbs.dart';

class DatabaseHelper {
  static late Database _database;

  static Future<void> openDatabase() async {
    final List<String> testes = Query();
    sqfliteFfiInit();
    
    var databaseFactory = databaseFactoryFfi;
    _database = await databaseFactory.openDatabase(inMemoryDatabasePath);

    await _database.execute(testes[0]);
    await _database.execute(testes[1]);
  }

  static Future<int> insert(String table, Map<String, Object> data) async {
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

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    return await _database.query(table);
  }

  static Future<int> edit(String table, int id, Map<String, dynamic> valuesToUpdate) async {
    return await _database.update(
      table,
      valuesToUpdate,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> delete(String table, int id) async {
    return await _database.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<void> closeDatabase() async {
    await _database.close();
  }
}
