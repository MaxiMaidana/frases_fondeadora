import 'package:flutter/material.dart';

///Template de pagina principal
class CommonPage extends StatelessWidget {
  final Widget bodyPage;
  const CommonPage({Key? key, required this.bodyPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width / 10),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: bodyPage,
        ),
      ),
    );
  }
}
