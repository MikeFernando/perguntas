import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String? texto;

  final void Function()? responder;

  const Resposta(this.texto, this.responder, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: responder,
        child: Text(texto!, style: const TextStyle(color: Colors.black87)),
      )
    );
  }
}
