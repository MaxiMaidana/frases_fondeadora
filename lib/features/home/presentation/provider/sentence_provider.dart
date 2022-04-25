import 'package:flutter/material.dart';
import '../../domain/api/sentence_api.dart';
import '../../../../data/models/response.dart';
import '../../domain/entities/qod.dart';

enum StateSentence {
  initial,
  loading,
  available,
  error,
}

class SentenceProvider extends ChangeNotifier {
  String sentence = '';
  StateSentence state = StateSentence.initial;
  bool charge = false;

  ///Metodo para actualizar la variable state
  void updateSentence(StateSentence value) {
    state = value;
    notifyListeners();
  }

  ///Metodo para actualizar la variable charge
  void updateCharge(bool value) {
    charge = value;
    notifyListeners();
  }

  ///Metodo que trae la frase
  Future<void> callSentence() async {
    try {
      updateSentence(StateSentence.loading);
      updateCharge(true);
      Qod sentencee = await SentenceApi().getSentence();
      sentence = sentencee.contents!.quotes!.first.quote!;
      updateSentence(StateSentence.available);
      updateCharge(false);
    } catch (e) {
      if (e is ResponseModel) {
        sentence = 'error al buscar la frase\n${e.statusCode}\n${e.data}.';
      } else {
        sentence =
            'error al buscar la frase, intentelo en unos minutos otra vez.';
      }
      updateSentence(StateSentence.error);
      updateCharge(false);
    }
  }
}
