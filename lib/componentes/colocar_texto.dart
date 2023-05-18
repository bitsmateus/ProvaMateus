import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ColocarTexto extends StatefulWidget {
  final texto;

  const ColocarTexto({super.key, this.texto});

  @override
  State<ColocarTexto> createState() => _ColocarTextoState();
}

class _ColocarTextoState extends State<ColocarTexto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        widget.texto,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
      ),
    );
  }
}
