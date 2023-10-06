import 'package:flutter_to_do_list/app/Constants/nameDbs.dart';
import 'package:flutter_to_do_list/app/data/db.util.dart';
import 'package:flutter_to_do_list/app/models/talks.dart';

class RepositoryTalks {
  static Future<void> AddTask(TalksModel talksModel) async {
    try {
      final result = await DbUtil.insert(
          NomeBanco.talks, talksModel.toMap(), talksColumns);
    } catch (e) {
      print(e);
    }
  }

  static Future<List<TalksModel>> GetTalks() async {
    // final results = await DbUtil.getData(NomeBanco.category, categoryColumns);
    final result = await DbUtil.getData(NomeBanco.talks, talksColumns);
    final maplist = result.map((e) => TalksModel.fromMap(e)).toList();
    return maplist;
  }

  static Future<List<TalksModel>> GetCategorys() async {
    // final results = await DbUtil.getData(NomeBanco.category, categoryColumns);
    final result = await DbUtil.getData(NomeBanco.category, categoryColumns);
    final maplist = result.map((e) => TalksModel.fromMap(e)).toList();
    return maplist;
  }

  static Future<void> addDefaultCategories() async {
    // Adicione suas categorias padrão aqui com os valores corretos para as colunas
    final defaultCategories = [
      {
        'nome': 'Categoria 1',
        'DataCriacao': DateTime.now()
            .toString(), // Você pode ajustar esta data conforme necessário
      },
      {
        'nome': 'Categoria 2',
        'DataCriacao': DateTime.now().toString(),
      },
      {
        'nome': 'Categoria 3',
        'DataCriacao': DateTime.now().toString(),
      },
    ];

     for (final category in defaultCategories) {
        try {
      final result = await DbUtil.insert(
          NomeBanco.category, category.values.toMap(), categoryColumns);
    } catch (e) {
      print(e);
    }
  }
  }
}
