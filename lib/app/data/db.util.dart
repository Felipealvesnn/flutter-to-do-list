import 'package:flutter_to_do_list/app/Constants/nameDbs.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/repository/repositoryTalks.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DbUtil implements DatabaseInstanceProvider {
  @override
  Future<sql.Database> databaseStatic() async {
    final dbPath = await sql.getDatabasesPath();
    final List<String> testes = Query();
    final db = await sql.openDatabase(
      join('${dbPath}tarefasAppFel.db'),
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

  @override
  Future<void> insert(String table, Map<String, Object> data) async {
    try {
      final db = await databaseStatic();
      await db.insert(
        table,
        data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Erro ao inserir os dados: $e");
      throw e;
    }
  }

  @override
  Future<void> delete(String table, String id) async {
    final db = await databaseStatic();
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> edit(String table, String id, Map<String, dynamic> valuesToUpdate) async {
    final db = await databaseStatic();
    await db.update(
      table,
      valuesToUpdate,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<Map<String, dynamic>>> getData(String tablem) async {
    final db = await databaseStatic();
    return db.query(tablem);
  }
  
  @override
  Future<void> closeDatabase() async {
    final db = await databaseStatic();
    await db.close();
  }
  
  @override
  Future<void> openDatabase() async {
    await databaseStatic();
  }

  // Resto do seu código...
}