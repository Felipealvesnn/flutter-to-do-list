import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DbUtil {
 
   static Future<sql.Database> databaseStatic(String tableName, List<String> columns) async {
    final dbPath = await sql.getDatabasesPath();
    final columnsString = columns.join(', ');
    final createTableSQL = 'CREATE TABLE $tableName($columnsString)';
    return sql.openDatabase(
      join(dbPath + 'demos.db'),
      onCreate: (db, version) {
        return db.execute(
         createTableSQL,
        );
      },
      version: 1,
    );
  }

  static Future<String> insert(
      String table, Map<String, Object> data, List<String> columns) async {
    try {
      final db = await databaseStatic(table, columns);
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
    final db = await databaseStatic(table, columns);
    db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> edit(String table, String id,
      Map<String, dynamic> valuesToUpdate, List<String> columns) async {
    final db = await databaseStatic(table, columns);
    await db.update(
      table,
      valuesToUpdate,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Map<String, dynamic>>> getData(
      String tablem, List<String> columns) async {
    final db = await databaseStatic(tablem, columns);
    return db.query(tablem);
  }

  // Resto do seu código...
}
