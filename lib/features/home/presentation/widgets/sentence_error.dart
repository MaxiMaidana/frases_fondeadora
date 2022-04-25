import 'package:flutter/material.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../provider/sentence_provider.dart';

class SentenceError extends StatelessWidget {
  final String error;
  const SentenceError({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final sentenceProvider = Provider.of<SentenceProvider>(context);

    return Column(
      children: [
        SizedBox(height: size.height / 6),
        Center(child: TextWidget.sentence(sentenceProvider.sentence)),
        const Icon(
          Icons.error_outline,
          color: Colors.black54,
        )
      ],
    );
  }
}
