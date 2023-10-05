import 'package:sqflite/sqflite.dart' as sql;

class DbUtil {
  static Future<sql.Database> database(String NomeDb) async {
    return sql.openDatabase(
      NomeDb, // Nome do banco de dados
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE places(id TEXT PRIMARY KEY, title TEXT, image TEXT, loc_lat REAL, loc_lng REAL, address TEXT, staticMapImageUrl TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbUtil.database(table);
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> delete(String table, String id) async {
    final db = await DbUtil.database(table);
    db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> edit(
      String table, String id, Map<String, dynamic> valuesToUpdate) async {
    final db = await database(table);
    await db.update(
      table,
      valuesToUpdate,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbUtil.database(table);
    return db.query(table);
  }
}
