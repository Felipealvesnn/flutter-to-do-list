import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_to_do_list/app/models/talks.dart';
import 'package:flutter_to_do_list/app/models/category.dart';
import 'package:flutter_to_do_list/app/modules/CreateNewTaskPage/repository/repositoryTalks.dart';

class RepositoryHome {
  static Future<List<CategoryQtdTalks>> GetTalksQtd() async {
    final listTalks = await RepositoryTalks.GetTalks();
    final categoryList = await RepositoryTalks.GetCategorys();
    List<CategoryQtdTalks> categoryQtdTalksList = [];

    // Calcular o número total de talks em todas as categorias.
    int totalTalks = listTalks.length;

    // Percorra a lista de categorias
    for (var category in categoryList) {
      // Use a função where para filtrar talks com o mesmo categoriaId
      var talksForCategory =
          listTalks.where((talk) => talk.categoriaId == category.id);

      // Calcule a porcentagem para esta categoria
      // double percentage = (talksForCategory.length / totalTalks) * 100;

      double percentage =
          (talksForCategory.length.toDouble() / totalTalks.toDouble());

      // Crie um objeto CategoryQtdTalks
      var categoryQtdTalks = CategoryQtdTalks(
        porcentagem: percentage,
        nome: category.nome ?? "",
        qtd: talksForCategory.length,
        icon: Icons.blur_circular, // Substitua pelo ícone desejado
      );

      // Adicione o objeto à lista resultante
      categoryQtdTalksList.add(categoryQtdTalks);
    }

    return categoryQtdTalksList;
  }
}

class CategoryQtdTalks {
  String nome;
  int qtd;
  IconData icon;
  double porcentagem;

  CategoryQtdTalks({
    required this.nome,
    required this.qtd,
    required this.icon,
    required this.porcentagem,
  });
}
