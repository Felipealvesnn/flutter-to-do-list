import 'package:sqflite/sqflite.dart' as sql;


class DbUtil {
  
 static Future<sql.Database> database(String tableName, List<String> columns) async {
  final columnsString = columns.join(', ');
  final createTableSQL = 'CREATE TABLE $tableName($columnsString)';
  
  return sql.openDatabase(
    'talks.db', // Nome do banco de dados
    onCreate: (db, version) {
      return db.execute(createTableSQL);
    },
    version: 1,
  );
}


  static Future<void> insert(String table, Map<String, Object> data,  List<String> columns) async {
    final db = await DbUtil.database(table, columns);
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> delete(String table, String id,  List<String> columns) async {
    final db = await DbUtil.database(table, columns);
    db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> edit(
      String table, String id, Map<String, dynamic> valuesToUpdate, List<String> columns) async {
    final db = await database(table, columns);
    await db.update(
      table,
      valuesToUpdate,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String tablem , List<String> columns) async {
    final db = await DbUtil.database(tablem, columns);
    return db.query(tablem);
  }




  
  // Resto do seu código...
}



