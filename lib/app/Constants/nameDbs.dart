

abstract class NomeBanco {
  static const String talks = 'Tarefas';
  static const String category = 'Category';
}

final categoryColumns = [
  'id INTEGER PRIMARY KEY AUTOINCREMENT',
  'nome TEXT',
  'DataCriacao TEXT',
];

final talksColumns = [
  'id TEXT PRIMARY KEY',
  'title TEXT',
  'description TEXT',
  'date TEXT',
  'StartTime TEXT',
  'EndTime TEXT',
  'categoriaId INTEGER', // Chave estrangeira
];

