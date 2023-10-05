import 'package:flutter_to_do_list/app/Constants/nameDbs.dart';
import 'package:flutter_to_do_list/app/data/db.util.dart';
import 'package:flutter_to_do_list/app/models/talks.dart';

class RepositoryTalks {


  void AddTask(TalksModel talksModel) {

    try {
         DbUtil.insert(NomeBanco.talks, {
        'id': talksModel.id,
        'title': talksModel.title,
        'date': talksModel.date,
        'StartTime': talksModel.StartTime,
        'EndTime': talksModel.EndTime,
        'categoriaId': talksModel.categoriaId,
      }, talksColumns);



    } catch (e) {
      print(e);
    }
    
     
     

  }
 

  
}