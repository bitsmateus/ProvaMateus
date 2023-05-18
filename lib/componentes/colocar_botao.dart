import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Botao extends StatefulWidget {
  final texto;
  final corFundo;
  final corFonte;
  final funcao;

  const Botao(
      {super.key, this.texto, this.corFundo, this.corFonte, this.funcao});

  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Center(
          child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: widget.corFonte,
          backgroundColor: widget.corFundo,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          minimumSize: const Size(200, 50),
        ),
        onPressed: widget.funcao,
        child: Text(widget.texto),
      )),
    );
  }
}
