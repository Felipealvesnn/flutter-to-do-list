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
  static Future<List<TalksModel>>GetTalks() async {
   // final results = await DbUtil.getData(NomeBanco.category, categoryColumns);
    final result = await DbUtil.getData(NomeBanco.talks, talksColumns);
    return result.map((e) => TalksModel.fromMap(e)).toList();
  }


}
