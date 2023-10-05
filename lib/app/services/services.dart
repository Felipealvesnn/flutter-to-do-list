import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // importante pra data funcionar
import 'package:intl/intl.dart';

abstract class UtilsServices {
  static String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }

  static String formatDateTimeMesAno(DateTime dateTime) {
    String formattedDate = DateFormat('MMMM, y', 'pt_BR').format(dateTime);
    return formattedDate;
  }

  // Função para obter os dias da semana do mês atual


// Função para obter os dias da semana do mês atual em português
static List<String> getDiasDaSemanaEmPortugues() {
  DateTime dataAtual = DateTime.now();
  int mesAtual = dataAtual.month;
  int diasNoMes = DateTime(dataAtual.year, mesAtual + 1, 0).day;
  List<String> diasDaSemana = [];
  for (int i = 0; i < diasNoMes; i++) {
    DateTime data = DateTime(dataAtual.year, mesAtual, i + 1);
    var format = DateFormat('E', 'pt_BR');
    diasDaSemana.add(format.format(data));
  }
  return diasDaSemana;
}


// Função para obter os dias do mês atual
  static List<String> getDiasDoMes() {
    DateTime dataAtual = DateTime.now();
    int mesAtual = dataAtual.month;
    int diasNoMes = DateTime(dataAtual.year, mesAtual + 1, 0).day;
    List<String> diasDoMes =
        List.generate(diasNoMes, (index) => (index + 1).toString());
    return diasDoMes;
  }

// Função para obter os horários (0 a 23)
  static List<int> getHorarios() {
    List<int> horarios = List.generate(24, (index) => index);
    return horarios;
  }
}
