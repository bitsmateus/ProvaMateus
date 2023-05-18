import 'package:flutter/material.dart';
import 'package:flutter_application_7/telas/tela_acao.dart';
import 'package:flutter_application_7/telas/tela_bitcoin.dart';
import 'package:flutter_application_7/telas/tela_moedas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/TelaMoedas",
      routes: {
        '/TelaMoedas': (context) => const TelaMoedas(),
        '/TelaBitcoin': (context) => TelaBitcoin(),
        '/TelaAcao': (context) => TelaAcao(),
      },
    );
  }
}
