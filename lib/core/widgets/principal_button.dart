import 'package:flutter/material.dart';

import 'text_widget.dart';

/// Widget custom de botones.
///
/// Utilizar los factory(principal).
class PrincipalButton extends StatefulWidget {
  final String textButton;
  final bool? loading;
  final Widget? loadingWidget;
  final Color? color;
  final void Function()? onPress;

  const PrincipalButton({
    Key? key,
    required this.textButton,
    required this.onPress,
    this.loading = false,
    this.color,
    this.loadingWidget,
  }) : super(key: key);

  /// Boton princiapal, se le tiene que pasar como parametro obligatorio un texto.
  /// De manera opcional una 'void Function' en onPress.
  ///
  /// De manera opcional un bool en loading para poder ver un widget de loading.
  ///
  /// De manera opcioanl un color ya que sino por defecto vendra [Colors.greenAccent].
  ///
  factory PrincipalButton.principal({
    required String textButton,
    void Function()? onPress,
    bool loading = false,
    Color? color,
  }) =>
      PrincipalButton(
        color: color,
        loading: loading,
        textButton: textButton,
        onPress: onPress,
      );

  @override
  State<PrincipalButton> createState() => _PrincipalButtonState();
}

class _PrincipalButtonState extends State<PrincipalButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: widget.onPress == null
                ? Colors.grey
                : widget.color ?? Colors.greenAccent,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1, 3),
                blurRadius: 3.5,
              ),
            ]),
        child: widget.loading!
            ? widget.loadingWidget ??
                Center(
                    child: Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.symmetric(
                    vertical: 1.0,
                    horizontal: 1.0,
                  ),
                  child: const CircularProgressIndicator(color: Colors.white),
                ))
            : Center(child: TextWidget.button(widget.textButton)),
      ),
      onPressed: widget.onPress,
    );
  }
}
