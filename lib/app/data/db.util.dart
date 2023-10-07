import 'package:flutter_to_do_list/app/Constants/nameDbs.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DbUtil {
  static Future<sql.Database> databaseStatic() async {
    final dbPath = await sql.getDatabasesPath();
    final List<String> testes = Query();
    final db = await sql.openDatabase(
      join(dbPath + 'tarefasApp.db'),
      onCreate: (db, version) async {
        await db.execute(
          testes[0],
        );
        await db.execute(
          testes[1],
        );
      },
      version: 3,
    );
    return db;
  }

  static Future<String> insert(
      String table, Map<String, Object> data) async {
    try {
      final db = await databaseStatic();
      await db.insert(
        table,
        data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
      return "Inserção bem-sucedida";
    } catch (e) {
      print(e);
      return "Erro ao inserir os dados: $e";
    }
  }

  static Future<void> delete(
      String table, String id, List<String> columns) async {
    final db = await databaseStatic();
    db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> edit(String table, String id,
      Map<String, dynamic> valuesToUpdate) async {
    final db = await databaseStatic();
    await db.update(
      table,
      valuesToUpdate,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Map<String, dynamic>>> getData(
      String tablem) async {
    final db = await databaseStatic();
    return db.query(tablem);
  }

  // Resto do seu código...
}
