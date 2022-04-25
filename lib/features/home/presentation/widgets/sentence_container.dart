import 'package:flutter/material.dart';
import 'sentence_error.dart';
import 'sentence_widget.dart';
import '../../../../core/widgets/text_widget.dart';
import '../provider/sentence_provider.dart';
import 'package:provider/provider.dart';

class SentenceContainer extends StatelessWidget {
  const SentenceContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sentenceProvider = Provider.of<SentenceProvider>(context);

    if (sentenceProvider.state == StateSentence.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (sentenceProvider.state == StateSentence.error) {
      return SentenceError(error: sentenceProvider.sentence);
    } else if (sentenceProvider.state == StateSentence.available) {
      return SentenceWidget(text: sentenceProvider.sentence);
    } else {
      return Center(child: TextWidget.sentence('Solicita tu Frace'));
    }
  }
}
