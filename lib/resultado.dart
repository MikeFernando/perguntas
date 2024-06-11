import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(
      {super.key,
      this.pontuacao = 0,
      required this.quandoReiniciarQuestionario});

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 16) {
      return 'Você é bom!';
    } else if (pontuacao < 19) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 32),
          ),
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blueAccent)),
            onPressed: quandoReiniciarQuestionario,
            child: const Text(
              'Reiniciar?',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
