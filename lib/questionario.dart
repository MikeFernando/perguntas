import 'package:flutter/material.dart';
import 'package:perguntas/questao.dart';
import 'package:perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) quandoResponder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder
  });

  bool get temPerguntaSelecionada => perguntaSelecionada < perguntas.length;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? (perguntas[perguntaSelecionada]['resposta']
            as List<Map<String, Object>>)
        : [];

    List<Widget> widgets = respostas
        .map((resposta) => Resposta(resposta['texto'].toString(),
            () => quandoResponder(resposta['pontuacao'] as int))).toList();

    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]['texto'].toString()),
        ...widgets
      ],
    );
  }
}
