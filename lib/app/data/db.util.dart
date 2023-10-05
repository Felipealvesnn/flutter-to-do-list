import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class DbUtil {
  static Future<sql.Database> database(
      String tableName, List<String> columns) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    final columnsString = columns.join(', ');
    final createTableSQL = 'CREATE TABLE $tableName($columnsString)';

    try {
      final bd = await sql.openDatabase(
        path, // Nome do banco de dados
        onCreate: (db, version) {
          return db.execute(createTableSQL);
        },
        version: 1,
      );
      return bd;
    } catch (e) {
      print('Erro ao criar a tabela $tableName: $e');
      // Aqui você pode lidar com o erro de acordo com suas necessidades.
      // Por exemplo, você pode lançar uma exceção personalizada ou retornar um valor padrão.
      // Se não desejar lidar com o erro aqui, você pode simplesmente relançá-lo.
      rethrow;
    }
  }

  static Future<sql.Database> databaseStatic() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Tarefas(id TEXT PRIMARY KEY, title TEXT, description TEXT, date TEXT, StartTime TEXT, EndTime TEXT, categoriaId INTEGER)');
    });

    return database;
  }

  static Future<String> insert(
      String table, Map<String, Object> data, List<String> columns) async {
    try {
      //final db = await DbUtil.database(table, columns);
      final db = await databaseStatic();
      await db.insert(
        table,
        data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );
      return "Inserção bem-sucedida";
    } catch (e) {
      return "Erro ao inserir os dados: $e";
    }
  }

  static Future<void> delete(
      String table, String id, List<String> columns) async {
    final db = await DbUtil.database(table, columns);
    db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> edit(String table, String id,
      Map<String, dynamic> valuesToUpdate, List<String> columns) async {
    final db = await database(table, columns);
    await db.update(
      table,
      valuesToUpdate,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Map<String, dynamic>>> getData(
      String tablem, List<String> columns) async {
    final db = await DbUtil.database(tablem, columns);
    return db.query(tablem);
  }

  // Resto do seu código...
}
