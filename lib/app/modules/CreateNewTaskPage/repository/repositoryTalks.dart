import 'package:flutter_to_do_list/app/Constants/nameDbs.dart';
import 'package:flutter_to_do_list/app/data/db.util.dart';
import 'package:flutter_to_do_list/app/models/category.dart';
import 'package:flutter_to_do_list/app/models/talks.dart';

class RepositoryTalks {
  static Future<void> AddTask(TalksModel talksModel) async {
    try {
      final result = await DbUtil.insert(
        NomeBanco.talks,
        talksModel.toMap(),
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<List<TalksModel>> GetTalks() async {
    // final results = await DbUtil.getData(NomeBanco.category, categoryColumns);
    final result = await DbUtil.getData(NomeBanco.talks);
    final maplist = result.map((e) {
      return TalksModel.fromMap(e);
    }).toList();
    return maplist;
  }

  static Future<List<Category>> GetCategorys() async {
    final result = await DbUtil.getData(
      NomeBanco.category,
    );
    final maplist = result.map((e) => Category.fromMap(e)).toList();

    // Verifica se a lista de categorias está vazia
    if (maplist.isEmpty) {
      // Se estiver vazia, adicione algumas categorias padrão
      await addDefaultCategories();

      // Após adicionar as categorias padrão, recupere os dados novamente
      final updatedResult = await DbUtil.getData(
        NomeBanco.category,
      );
      maplist.addAll(updatedResult.map((e) => Category.fromMap(e)));
    }

    return maplist;
  }

  static Future<void> deteleTalk(TalksModel talksModel) async {
    try {
      final result = await DbUtil.delete(
        NomeBanco.talks,
        talksModel.id!.toString(),
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<void> addDefaultCategories() async {
    // Adicione suas categorias padrão aqui com os valores corretos para as colunas
    final defaultCategories = [
      {
        'nome': 'Lazer',
        'dataCriacao': DateTime.now()
            .toString(), // Você pode ajustar esta data conforme necessário
      },
      {
        'nome': 'Saude',
        'dataCriacao': DateTime.now().toString(),
      },
      {
        'nome': 'Comida',
        'dataCriacao': DateTime.now().toString(),
      },
    ];

    for (final category in defaultCategories) {
      try {
        final result = await DbUtil.insert(
          NomeBanco.category,
          category,
        );
      } catch (e) {
        print(e);
      }
    }
  }
}
