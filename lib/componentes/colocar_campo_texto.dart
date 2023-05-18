import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CampoDeTexto extends StatefulWidget {
  final texto;
  final msgVal;
  final senha;
  final controlador;

  const CampoDeTexto(
      {super.key,
      this.texto,
      this.msgVal,
      this.senha = false,
      this.controlador});

  @override
  State<CampoDeTexto> createState() => _CampoDeTextoState();
}

class _CampoDeTextoState extends State<CampoDeTexto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: widget.controlador,
        validator: (value) {
          if (value!.isEmpty) {
            return widget.msgVal;
          }
          //return null;
        },
        obscureText: widget.senha,
        decoration: InputDecoration(
            labelText: widget.texto,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
      ),
    );
  }
}
