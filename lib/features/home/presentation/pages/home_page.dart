import 'package:flutter/material.dart';
import '../../../../core/templates/common_page.dart';
import '../../../../core/widgets/principal_button.dart';
import '../../../../core/widgets/text_widget.dart';
import '../provider/sentence_provider.dart';
import '../widgets/sentence_container.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final sentenceProvider = Provider.of<SentenceProvider>(context);
    Size size = MediaQuery.of(context).size;

    return CommonPage(
      bodyPage: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height / 8),
          TextWidget.title('Tu Frase del dia.'),
          SizedBox(height: size.height / 8),
          const SentenceContainer(),
          const Spacer(),
          PrincipalButton.principal(
            loading: sentenceProvider.charge,
            color: Colors.blue[400],
            textButton: 'Busca tu frase',
            onPress: () => sentenceProvider.charge
                ? () {}
                : context.read<SentenceProvider>().callSentence(),
          ),
          SizedBox(height: size.height / 15),
        ],
      ),
    );
  }
}
