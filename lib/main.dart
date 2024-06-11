import 'package:flutter/material.dart';
import 'package:perguntas/questionario.dart';
import 'package:perguntas/resultado.dart';

void main() => runApp(const PerguntasApp());

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({super.key});

  @override
  State<PerguntasApp> createState() => _PerguntasAppState();
}

class _PerguntasAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = [
    {
      'texto': 'Qual sua cor favorita?',
      'resposta': [
        {'texto': 'Azul', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Amarelo', 'pontuacao': 3},
        {'texto': 'Vermelho', 'pontuacao': 1}
      ]
    },
    {
      'texto': 'Qual seu animal favorito?',
      'resposta': [
        {'texto': 'Cachorro', 'pontuacao': 8},
        {'texto': 'Gato', 'pontuacao': 4},
        {'texto': 'Pato', 'pontuacao': 7},
        {'texto': 'Cavalo', 'pontuacao': 2}
      ]
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'resposta': [
        {'texto': 'Maria', 'pontuacao': 6},
        {'texto': 'João', 'pontuacao': 9},
        {'texto': 'Leo', 'pontuacao': 7},
        {'texto': 'Pedro', 'pontuacao': 3},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada => _perguntaSelecionada < _perguntas.length;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Center(
                child: Text(
              'Perguntas',
              style: TextStyle(color: Colors.white),
            )),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _responder)
              : Resultado(
                  pontuacao: _pontuacaoTotal,
                  quandoReiniciarQuestionario: _reiniciarQuestionario,
                )),
    );
  }
}
