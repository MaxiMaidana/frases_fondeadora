import 'package:flutter/material.dart';
import '../../../../core/widgets/text_widget.dart';

class SentenceWidget extends StatelessWidget {
  final String text;
  const SentenceWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 8,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextWidget.sentence(text),
            ),
          ],
        ),
      ),
    );
  }
}
