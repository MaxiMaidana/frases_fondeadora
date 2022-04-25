import 'package:flutter/material.dart';
import '../../../../core/templates/common_page.dart';
import '../helpers/auth_helper.dart';
import '../../../../core/widgets/principal_button.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../../../core/widgets/input_widget.dart';
import '../providers/auth_provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context);
    return CommonPage(
      bodyPage: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height / 8),
              TextWidget.title(
                'Fondeadora Frases.',
                key: const Key('textTitle'),
              ),
              const SizedBox(height: 20),
              InputWidget(
                key: const Key('input1'),
                controller: emailController,
                hint: 'email',
                onChange: (s) => authProvider.areValidCredentials(
                    s, passwordController.text),
              ),
              const SizedBox(height: 20),
              InputWidget(
                key: const Key('input2'),
                controller: passwordController,
                hint: 'password',
                isPassword: true,
                onChange: (s) =>
                    authProvider.areValidCredentials(emailController.text, s),
              ),
              const Spacer(),
              PrincipalButton.principal(
                loading: authProvider.isLoading,
                textButton: 'Continuar',
                onPress: authProvider.validCredential
                    ? () async => AuthHelper().authFunction(
                          context,
                          emailController.text,
                          passwordController.text,
                        )
                    : null,
              ),
              Flexible(child: SizedBox(height: size.height / 15)),
            ],
          ),
        ],
      ),
    );
  }
}
