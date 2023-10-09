import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/models/category.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/repository/repositoryTalks.dart';

class RepositoryHome {
  static Future<List<CategoryQtdTalks>> GetTalksQtd() async {
    final listTalks = await RepositoryTalks.GetTalks();
    final categorylis = await RepositoryTalks.GetCategorys();
    List<CategoryQtdTalks> categoryQtdTalksList = [];

    // Percorra a lista de categorias
    for (var category in categorylis) {
      // Use a função where para filtrar talks com o mesmo categoriaId
      var talksForCategory =
          listTalks.where((talk) => talk.categoriaId == category.id);

      // Crie um objeto CategoryQtdTalks
      var categoryQtdTalks = CategoryQtdTalks(
        nome: category.nome ?? "",
        qtd: talksForCategory.length,
        icon: Icons.blur_circular, // Substitua pelo ícone desejado
      );

      // Adicione o objeto à lista resultante
      categoryQtdTalksList.add(categoryQtdTalks);
    }

    // Exiba os resultados
    for (var categoryQtdTalks in categoryQtdTalksList) {
      print(
          "Categoria: ${categoryQtdTalks.nome}, Quantidade: ${categoryQtdTalks.qtd}");
    }

    return categoryQtdTalksList;
  }
}

class CategoryQtdTalks {
  String nome;
  int qtd;
  IconData icon;
  CategoryQtdTalks({
    required this.nome,
    required this.qtd,
    required this.icon,
  });
}
