abstract class NomeBanco {
  static const String talks = 'Tarefas';
  static const String category = 'Categoria';
}

final categoryColumns = [
  'id INTEGER  PRIMARY KEY AUTOINCREMENT',
  'nome TEXT',
  'dataCriacao TEXT',
];

final talksColumns = [
  'id INTEGER  PRIMARY KEY AUTOINCREMENT',
  'title TEXT',
  'description TEXT',
  'date TEXT',
  'StartTime TEXT',
  'EndTime TEXT',
  'categoriaId INTEGER', // Chave estrangeira
];

List<String> Query() {
  final columnstalks = talksColumns.join(', ');
  final columnsCategory = categoryColumns.join(', ');

  final tarefa = 'CREATE TABLE ${NomeBanco.talks} ($columnstalks)';

  final category = 'CREATE TABLE ${NomeBanco.category} ($columnsCategory)';

  List<String> list = [tarefa, category];

  return list;
}
